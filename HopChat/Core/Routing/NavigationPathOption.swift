//
//  NavigationPathOption.swift
//  ChatterFly
//
//  Created by Pranav on 23/12/25.
//
import SwiftUI
import Foundation

enum NavigationPathOption: Hashable {
    case chat(avatarId: String)
    case category(category: CharacterOption, imageName: String)
}

extension View{
    func navigationDestinationForCoreModule(path:Binding<[NavigationPathOption]>) -> some View {
        self
            .navigationDestination(for: NavigationPathOption.self) { route in
                switch route {
                    
                case .chat(let avatarId):
                    ChatView(avatarId: avatarId)
                    
                case .category(let category, let imageName):
                    CategoryListView(
                        path: path, category: category,
                        imageName: imageName
                    )
                }
            }
    }
}
