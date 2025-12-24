//
//  CategoryListView.swift
//  ChatterFly
//
//  Created by Pranav on 21/12/25.
//

import SwiftUI

struct CategoryListView: View {
    
    @Binding var path : [NavigationPathOption]
    var category: CharacterOption = .alien
    var imageName: String = Constants.randomImage
    @State private var avatars: [Avatar] = Avatar.mocks
    
    var body: some View {
        List {
            CategoryCellView(
                title: category.plural.capitalized,
                imageName: imageName,
                font: .largeTitle,
                cornerRadius: 0
            )
            .removeExtraListFormatting()
            
            ForEach(avatars, id: \.self) { avatar in
                CustomListCellView(
                    imageName: avatar.profileImageName,
                    title: avatar.name,
                    subtitle: avatar.characterDescription
                )
                .anyButton(style: .highlight, action: {
                    onAvatarPressed(avatar: avatar)
                })
                .removeExtraListFormatting()
            }
        }
        .ignoresSafeArea()
        .listStyle(PlainListStyle())
    }
    
    private func onAvatarPressed(avatar:Avatar){
        path.append(.chat(avatarId: avatar.avatarId))
    }
}

#Preview {
    CategoryListView(path: .constant([]))
}
