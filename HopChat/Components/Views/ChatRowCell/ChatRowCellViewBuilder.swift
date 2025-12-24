//
//  ChatRowCellViewBuilder.swift
//  ChatterFly
//
//  Created by Pranav on 30/10/25.
//

import SwiftUI

struct ChatRowCellViewBuilder: View {
    
    var currentUserId: String?
    
    var chat: Chat
    @State private var avatar: Avatar?
    var getAvatar: () async -> Avatar?
    
    @State private var lastchatMessage: ChatMessage?
    var getLastMessage: () async -> ChatMessage?
    
    @State private var didLoadAvatar = false
    @State private var didLoadChatMessage = false
    
    private var isLoading: Bool {
        !(didLoadAvatar && didLoadChatMessage)
    }
    
    private var hasNewChat: Bool {
        guard let lastchatMessage, let currentUserId else { return false }
        return !lastchatMessage.hasSeenBy(userId: currentUserId)
    }
    
    private var subheadline: String? {
        if isLoading { return "xxxx xxxx xxxxx xxxx" }
        if avatar == nil && lastchatMessage == nil { return "Error" }
        return lastchatMessage?.content
    }
    
    var body: some View {
        ChatRowCellView(
            title: isLoading ? "xxxx xxxx" : avatar?.name,
            subtitle: subheadline,
            profileImage: avatar?.profileImageName,
            isLastMessage: isLoading ? false : hasNewChat
        )
        .redacted(reason: isLoading ? .placeholder : [])
        .task {
            avatar = await getAvatar()
            didLoadAvatar = true
        }
        .task {
            lastchatMessage = await getLastMessage()
            didLoadChatMessage = true
        }
    }
}


#Preview {
    VStack{
        List {
            ChatRowCellViewBuilder(chat: .mock, getAvatar: {
                try? await Task.sleep(for: .seconds(5))
                return .mock
            }, getLastMessage: {
                try? await Task.sleep(for: .seconds(5))
                return .mock
            })
            
            ChatRowCellViewBuilder(chat: .mock, getAvatar: {
                .mock
            }, getLastMessage: {
                .mock
            })
            
            ChatRowCellViewBuilder(chat: .mock, getAvatar: {
                nil
            }, getLastMessage: {
                nil
            })
        }
    }
}
