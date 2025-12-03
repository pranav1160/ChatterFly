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
                Text(chat.id)
            }
            .navigationTitle("Chat")
        }
    }
}

#Preview {
    ChatListView()
}
