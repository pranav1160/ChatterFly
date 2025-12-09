//
//  ChatView.swift
//  ChatterFly
//
//  Created by Pranav on 23/10/25.
//

import SwiftUI

struct ChatListView: View {
    @State private var chats = Chat.mocks
    var body: some View {
        NavigationStack {
            List(chats) { chat in
                NavigationLink {
                    ChatView()
                } label: {
                    Text(chat.id)
                }
            }
            .navigationTitle("Chat")
        }
    }
}

#Preview {
    ChatListView()
}
