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
    
    var body: some View {
        NavigationStack {
            List {
                featuredSection
                
                categorySection
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
                            title: category.rawValue.capitalized,
                            imageName: Constants.randomImage,
                            font: .title2,
                            cornerRadius: 20
                        )
                        
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
}

#Preview {
    ExploreView()
}
