//
//  Chat.swift
//  ChatterFly
//
//  Created by Pranav on 29/10/25.
//

import Foundation

struct Chat:Identifiable {
    let id: String
    let userId: String
    let avatarId: String
    let dateCreated: Date
    let dateModified: Date
}

extension Chat {
    static var mocks: [Chat] {
        let now = Date()
        return [
            Chat(id: "mock_chat_1", userId: "user1", avatarId: "avatar1", dateCreated: now, dateModified: now.addingTimeInterval(minutes: -30)),
            Chat(id: "mock_chat_2", userId: "user2", avatarId: "avatar2", dateCreated: now.addingTimeInterval(hours: -1), dateModified: now.addingTimeInterval(minutes: -30)),
            Chat(id: "mock_chat_3", userId: "user3", avatarId: "avatar3", dateCreated: now.addingTimeInterval(hours: -2), dateModified: now.addingTimeInterval(hours: -1)),
            Chat(id: "mock_chat_4", userId: "user4", avatarId: "avatar4", dateCreated: now.addingTimeInterval(days: -1), dateModified: now.addingTimeInterval(hours: -10))
        ]
    }
    
    static var mock:Chat{
        return mocks[0]
    }
}
