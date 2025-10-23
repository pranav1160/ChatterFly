//
//  OnBoardingCompletedView.swift
//  ChatterFly
//
//  Created by Pranav on 24/10/25.
//

import SwiftUI

struct OnBoardingCompletedView: View {
    @Environment(AppState.self) private var appstate
    var body: some View {
        NavigationStack {
            VStack {
                Text("Onboarding Completed")
                    .frame(maxHeight: .infinity)
                
                Button {
                    appstate.updateViewState(showTabBarView: true)
                }label: {
                    Text("Finish")
                        .callToAction()
                }
            }
            .padding()
        }
    }
}

#Preview {
    OnBoardingCompletedView()
        .environment(AppState(showTabBar: true))
}
