//
//  ChatView.swift
//  ChatterFly
//
//  Created by Pranav on 23/10/25.
//

import SwiftUI

struct ChatListView: View {
    @State private var chats = Chat.mocks
    @State private var path : [NavigationPathOption] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(chats) { chat in
                    
                    ChatRowCellViewBuilder(
                        currentUserId: nil,
                        chat: chat,
                        getAvatar: {
                            // async fetch avatar
                            try? await Task.sleep(for: .seconds(1))
                            return Avatar.mocks.randomElement()!
                        },
                        getLastMessage: {
                            // async fetch last message
                            try? await Task.sleep(for: .seconds(1))
                            return ChatMessage.mocks.randomElement()!
                        }
                    )
                    .anyButton(style: .highlight) {
                        onChatPressed(chat: chat)
                    }
                }
                .buttonStyle(.plain)
            }
            
            .listStyle(.plain)
            .navigationTitle("Chats")
            .navigationDestinationForCoreModule(path: $path)
        }
    }
    
    private func onChatPressed(chat:Chat){
        path.append(.chat(avatarId: chat.avatarId))
    }
    
}


#Preview {
    ChatListView()
}
