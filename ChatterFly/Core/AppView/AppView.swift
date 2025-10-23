//
//  AppView.swift
//  ChatterFly
//
//  Created by Pranav on 21/10/25.
//

import SwiftUI

struct AppView: View {
    @State private var showTabBar = false
    var body: some View {
        AppViewBuilder(
            showTabBar: showTabBar,
            tabBarView: {
                TabBarView()
            },
            onBoardingView: {
                WelcomeView()
            }
        )
        .onTapGesture {
            showTabBar.toggle()
        }
    }
}

#Preview {
    AppView()
}
