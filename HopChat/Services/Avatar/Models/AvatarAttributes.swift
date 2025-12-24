//
//  AvatarAttributes.swift
//  ChatterFly
//
//  Created by Pranav on 02/12/25.
//

import Foundation

enum CharacterOption:String,CaseIterable,Hashable{
    case man,woman,alien,dog,cat
    
    var plural: String {
        switch self {
        case .man:
            return "men"
        case .woman:
            return "women"
        case .alien:
            return "aliens"
        case .dog:
            return "dogs"
        case .cat:
            return "cats"
        }
    }

    
    static var defaultCharacter:Self{
        .cat
    }
}

enum CharacterAction:String,CaseIterable,Hashable{
    case smiling,sitting,eating,drinking,walking,shopping,studying,working,relaxing,fighting,crying
    
    static var defaultAction:Self{
        .sitting
    }
}

enum CharacterLocation:String,CaseIterable,Hashable{
    case park,mall,museum,city,desert,forest,space
    static var defaultLocation:Self{
        .park
    }
}
