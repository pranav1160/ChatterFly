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
    
    var body: some View {
        NavigationStack {
            List {
                featuredSection
                
                categorySection
                
                popularSection
            }
            .navigationTitle("Explore")
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
                        print("featured : \(item.name!)")
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
                        CategoryCellView(
                            title: category.plural.capitalized,
                            imageName: Constants.randomImage,
                            font: .title2,
                            cornerRadius: 20
                        )
                        .anyButton(style: .pressable) {
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
                    
                }
                .removeExtraListFormatting()
            }
        }header: {
            Text("Popular")
        }
    }
}

#Preview {
    ExploreView()
}
