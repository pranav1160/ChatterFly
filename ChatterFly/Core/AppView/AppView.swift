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
                ZStack {
                Color.blue.ignoresSafeArea()
                Text("Tab Bar View")
            }},
            onBoardingView: {
                ZStack {
                    Color.red.ignoresSafeArea()
                    Text("Onboarding View")
                }
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
