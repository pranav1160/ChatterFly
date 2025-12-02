//
//  Avatar.swift
//  ChatterFly
//
//  Created by Pranav on 25/10/25.
//

import Foundation

struct Avatar:Hashable{
    let avatarId:String
    let name:String?
    let characterOption:CharacterOption?
    let characterAction:CharacterAction?
    let characterLocation:CharacterLocation?
    let profileImageName:String?
    let authorId:String?
    let dateCreated:Date?
    
    var characterDescription:String {
        AvatarDescriptionBuilder(avatar: self).characterDescription
    }
    
    init(
        avatarId: String,
        name: String? = nil,
        characterOption: CharacterOption? = nil,
        characterAction: CharacterAction? = nil,
        characterLocation: CharacterLocation? = nil,
        profileImageName: String? = nil,
        authorId: String? = nil,
        dateCreated: Date? = nil
    ) {
        self.avatarId = avatarId
        self.name = name
        self.characterOption = characterOption
        self.characterAction = characterAction
        self.characterLocation = characterLocation
        self.profileImageName = profileImageName
        self.authorId = authorId
        self.dateCreated = dateCreated
    }
    
    static var mocks: [Avatar] = [
        Avatar(
            avatarId: UUID().uuidString,
            name: "Alpha",
            characterOption: .woman,
            characterAction: .studying,
            characterLocation: .park,
            profileImageName: Constants.randomImage,
            authorId: UUID().uuidString,
            dateCreated: Date()
        ),
        Avatar(
            avatarId: UUID().uuidString,
            name: "Beta",
            characterOption: .man,
            characterAction: .working,
            characterLocation: .city,
            profileImageName: Constants.randomImage,
            authorId: UUID().uuidString,
            dateCreated: Date()
        ),
        Avatar(
            avatarId: UUID().uuidString,
            name: "Gamma",
            characterOption: .alien,
            characterAction: .shopping,
            characterLocation: .mall,
            profileImageName: Constants.randomImage,
            authorId: UUID().uuidString,
            dateCreated: Date()
        ),
        Avatar(
            avatarId: UUID().uuidString,
            name: "Delta",
            characterOption: .dog,
            characterAction: .relaxing,
            characterLocation: .forest,
            profileImageName: Constants.randomImage,
            authorId: UUID().uuidString,
            dateCreated: Date()
        )
    ]
    
    static var mock: Avatar = mocks[0]

}

struct AvatarDescriptionBuilder{
    let characterOption:CharacterOption
    let characterAction:CharacterAction
    let characterLocation:CharacterLocation
    
    init(
        characterOption: CharacterOption,
        characterAction: CharacterAction,
        characterLocation: CharacterLocation
    ) {
        self.characterOption = characterOption
        self.characterAction = characterAction
        self.characterLocation = characterLocation
    }
    
    init(avatar:Avatar){
        self.characterOption =   avatar.characterOption ?? .defaultCharacter
        self.characterAction =   avatar.characterAction ?? .defaultAction
        self.characterLocation = avatar.characterLocation ?? .defaultLocation
    }
    
    var characterDescription:String{
        "A \(characterOption) that is \(characterAction) in the \(characterLocation)"
    }
}
