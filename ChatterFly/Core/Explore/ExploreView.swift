//
//  ExploreView.swift
//  ChatterFly
//
//  Created by Pranav on 23/10/25.
//

import SwiftUI


struct ExploreView: View {
    let avatar = Avatar.mock
    @State private var featuredAvatars:[Avatar] = Avatar.mocks
    @State private var categories:[CharacterOption] = CharacterOption.allCases
    @State private var popularAvatars:[Avatar] = Avatar.mocks
    
    @State private var path : [NavigationPathOption] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                featuredSection
                
                categorySection
                
                popularSection
            }
            .navigationTitle("Explore")
            .navigationDestinationForCoreModule(path: $path)

        }
    }
    
    private var featuredSection:some View{
        Section {
            CarouselView(
                items: featuredAvatars,
                content: { item in
                    HeroCellView(
                        title: item.name,
                        subTitle: item.characterDescription,
                        imageName: item.profileImageName
                    )
                    .anyButton {
                        onAvatarPressed(avatar: avatar)
                    }
                }
            )
            .removeExtraListFormatting()
            
        } header: {
            Text("Featured Avatars")
        }
    }
    
    private  var categorySection:some View{
        Section {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(categories, id: \.self) { category in
                        if let imgName = popularAvatars.first(where: {
                            $0.characterOption == category
                        })?.profileImageName {
                            CategoryCellView(
                                title: category.plural.capitalized,
                                imageName: Constants.randomImage,
                                font: .title2,
                                cornerRadius: 20
                            )
                            .anyButton(style: .pressable) {
                                onCategoryPressed(
                                    category: category,
                                    imgName: imgName
                                )
                            }
                        }
                       
                    }
                }
            }
            .frame(height: 140)
            .scrollIndicators(.hidden)
            .scrollTargetLayout()
            .scrollTargetBehavior(.viewAligned)
            .removeExtraListFormatting()
        } header: {
            Text("Categories")
        }
    }
    
    private var popularSection:some View{
        Section{
            ForEach(popularAvatars,id: \.self) { avatar in
                CustomListCellView(
                    imageName: avatar.profileImageName,
                    title: avatar.name,
                    subtitle: avatar.characterDescription
                )
                .anyButton(style: .highlight) {
                    onAvatarPressed(avatar: avatar)
                }
                .removeExtraListFormatting()
            }
        }header: {
            Text("Popular")
        }
    }
    
    private func onAvatarPressed(avatar:Avatar){
        path.append(.chat(avatarId: avatar.avatarId))
    }
    
    private func onCategoryPressed(category:CharacterOption,imgName:String){
        path
            .append(
                .category(category: category, imageName: imgName)
            )
    }
}

#Preview {
    ExploreView()
}
