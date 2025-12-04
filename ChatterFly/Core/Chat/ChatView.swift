//
//  ChatView.swift
//  ChatterFly
//
//  Created by Pranav on 03/12/25.
//

import SwiftUI

struct ChatView: View {
    
    @State private var chatMessages: [ChatMessage] = ChatMessage.mocks
    @State private var avatar: Avatar? = .mock
    @State private var currentUser: User? = .mock
    @State private var textFieldText:String = ""
    @State private var showChatSettings:Bool = false
    @State private var scrollPosition:String?
    
    private var scrollSection:some View{
        ScrollView {
            LazyVStack(spacing: 24) {
                ForEach(chatMessages) { message in
                    let isCurrentUser = message.authorId == currentUser?.userId
                    ChatBubbleViewBuilder(
                        message: message,
                        isCurrentUser: isCurrentUser,
                        imageName: isCurrentUser ? nil : avatar?.profileImageName
                    )
                    .id(message.id)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(8)
        }
        .defaultScrollAnchor(.bottom)
        .scrollPosition(id:$scrollPosition, anchor: .center)
        .animation(.default, value: chatMessages.count)
        .animation(.default, value: scrollPosition)
    }
    private var textFieldSection:some View{
        TextField("Say something...", text: $textFieldText)
            .keyboardType(.alphabet)
            .autocorrectionDisabled()
            .padding(12)
            .padding(.trailing, 60)
            .overlay(
                Image(systemName: "arrow.up.circle.fill")
                    .font(.system(size: 32))
                    .padding(.trailing, 4)
                    .foregroundStyle(.accent)
                    .anyButton(style:.plain, action: {
                        onSendMessage()
                    }),
                alignment: .trailing
            )
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 100)
                        .fill(Color(uiColor: .systemBackground))
                    
                    RoundedRectangle(cornerRadius: 100)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                }
            )
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(Color(uiColor: .secondarySystemBackground))
    }
    
    private func onSendMessage(){
        guard let currentUser else {return}
        
        let message :ChatMessage = ChatMessage(
            id: UUID().uuidString,
            chatId: UUID().uuidString,
            authorId: currentUser.userId,
            content: textFieldText,
            seenByIds: nil,
            dateCreated: .now
        )
        
        chatMessages.append(message)
        scrollPosition = message.id
        textFieldText = ""
    }
    private func onChatSettingsPressed(){
        showChatSettings = true
    }
    
    var body: some View {
        VStack(spacing: 0) {
            scrollSection
                
            textFieldSection
            
        }
        .navigationTitle(avatar?.name ?? "Chat")
        .toolbar{
            ToolbarItem(placement: .topBarTrailing) {
                Image(systemName: "ellipsis")
                    .padding(8)
                    .anyButton {
                        onChatSettingsPressed()
                    }
            }
        }
        .confirmationDialog("", isPresented: $showChatSettings) {
            Button("Report User / Chat",role: .destructive) {
                
            }
            
            Button("Delete Chat",role: .destructive) {
                
            }
            
        }message: {
            Text("What would you like to do?")
        }
        
        .toolbarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ChatView()
    }
}
