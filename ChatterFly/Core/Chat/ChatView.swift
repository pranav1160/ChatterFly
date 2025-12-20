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
    @State private var showChatSettings:AnyAppAlert?
    @State private var scrollPosition:String?
    @State private var alert:AnyAppAlert?
    @State private var showProfileModal:Bool = false

    var body: some View {
        ZStack{
            VStack(spacing: 0) {
                scrollSection
                
                textFieldSection
                
            }
            if showProfileModal{
                
                Color.black.opacity(0.6).ignoresSafeArea()
                    .onTapGesture {
                        showProfileModal = false
                    }
                if let avatar{
                    ProfileModalView(
                        imageName: avatar.profileImageName,
                        title: avatar.name,
                        subtitle: avatar.characterOption?.rawValue.capitalized,
                        headline: avatar.characterDescription,
                        onXMarkPressed: {
                            showProfileModal = false
                        }
                    )
                    .padding(40)
                    .transition(
                        .asymmetric(
                            insertion: .scale.animation(.bouncy(duration: 0.4)),
                            removal: .identity.animation(.bouncy))
                    )
                }
                    
            }
            
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
        .showCustomAlert(type: .confirmationDialog, alert: $showChatSettings)
        .showCustomAlert(alert: $alert)
        .toolbarTitleDisplayMode(.inline)
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
        
        let content = textFieldText
        do{
            try TextValidationHelper.checkMessage(text: content)
            chatMessages.append(message)
            scrollPosition = message.id
            textFieldText = ""
        } catch let error {
            alert = AnyAppAlert(
                error: error
            )
        }
    }
    
    private func onChatSettingsPressed() {
        showChatSettings = AnyAppAlert(
            alertTitle: "",
            alertSubtitle: "What would you like to do?",
            buttons: {
                AnyView(
                    Group {
                        Button("Report User / Chat", role: .destructive) {
                            
                        }
                        
                        Button("Delete Chat", role: .destructive) {
                            
                        }
                    }
                )
            }
        )
    }

    private var scrollSection:some View{
        ScrollView {
            LazyVStack(spacing: 24) {
                ForEach(chatMessages) { message in
                    let isCurrentUser = message.authorId == currentUser?.userId
                    ChatBubbleViewBuilder(
                        message: message,
                        isCurrentUser: isCurrentUser,
                        imageName: isCurrentUser ? nil : avatar?.profileImageName,
                        onAvatarPressed: {
                            showProfileModal = true
                        }
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
    
}

#Preview {
    NavigationStack {
        ChatView()
    }
}
