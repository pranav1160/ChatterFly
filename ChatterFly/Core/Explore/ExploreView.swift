//
//  ExploreView.swift
//  ChatterFly
//
//  Created by Pranav on 23/10/25.
//

import SwiftUI

struct ExploreView: View {
    let avatar = Avatar.mock
    var body: some View {
        NavigationStack {
            CarouselView(
                items: Avatar.mocks,
                content: { item in
                    HeroCellView(
                        title: item.name,
                        subTitle: item.characterDescription,
                        imageName: item.profileImageName
                    )
                }
            )
            .padding()
                .padding()
            
            .navigationTitle("Explore")
        }
    }
}

#Preview {
    ExploreView()
}
