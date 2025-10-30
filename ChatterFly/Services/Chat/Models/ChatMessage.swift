//
//  ChatMessage.swift
//  ChatterFly
//
//  Created by Pranav on 29/10/25.
//

import Foundation

struct ChatMessage {
    let id: String
    let chatId: String
    let authorId: String?
    let content: String?
    let seenByIds: [String]?
    let dateCreated: Date?
    
     func hasSeenBy(userId:String) -> Bool{
        guard let seenByIds else {return false}
        
        return seenByIds.contains(userId)
    }
    
    init(
        id: String,
        chatId: String,
        authorId: String? = nil,
        content: String? = nil,
        seenByIds: [String]? = nil,
        dateCreated: Date? = nil
    ) {
        self.id = id
        self.chatId = chatId
        self.authorId = authorId
        self.content = content
        self.seenByIds = seenByIds
        self.dateCreated = dateCreated
    }
}

extension ChatMessage {
    static var mocks: [ChatMessage] {
        let now = Date()
        return [
            ChatMessage(
                id: "msg_1",
                chatId: "mock_chat_1",
                authorId: "user1",
                content: "Hey! How’s it going?",
                seenByIds: ["user2", "user3"],
                dateCreated: now.addingTimeInterval(minutes: -5)
            ),
            ChatMessage(
                id: "msg_2",
                chatId: "mock_chat_1",
                authorId: "user2",
                content: "All good bro, just chilling 😎",
                seenByIds: ["user1"],
                dateCreated: now.addingTimeInterval(minutes: -4)
            ),
            ChatMessage(
                id: "msg_3",
                chatId: "mock_chat_1",
                authorId: "user3",
                content: "Yo same here, weekend vibes!",
                seenByIds: ["user1", "user2"],
                dateCreated: now.addingTimeInterval(minutes: -2)
            ),
            ChatMessage(
                id: "msg_4",
                chatId: "mock_chat_2",
                authorId: "user4",
                content: "You guys free for a game later?",
                seenByIds: ["user1"],
                dateCreated: now.addingTimeInterval(hours: -1)
            )
        ]
    }
    
    static var mock: ChatMessage {
        mocks[0]
    }
}
