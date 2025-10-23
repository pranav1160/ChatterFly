//
//  AppView.swift
//  ChatterFly
//
//  Created by Pranav on 21/10/25.
//

import SwiftUI

struct AppView: View {
    @State private var appState = AppState()
    var body: some View {
        AppViewBuilder(
            showTabBar: appState.showTabBar,
            tabBarView: {
                TabBarView()
            },
            onBoardingView: {
                WelcomeView()
            }
        )
        .environment(appState)
    }
}

#Preview("AppView - TabBar") {
    AppView()
        .environment(AppState(showTabBar: true))
}

#Preview("AppView - OnBoarding") {
    AppView()
        .environment(AppState(showTabBar: false))
}
