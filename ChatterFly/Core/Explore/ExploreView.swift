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
            HeroCellView(
                title: avatar.name,
                subTitle: avatar.characterDescription,
                imageName: avatar.profileImageName
            )
            .frame(width: 350,height: 250)
            
            .navigationTitle("Explore")
        }
    }
}

#Preview {
    ExploreView()
}
