//
//  WelcomeView.swift
//  ChatterFly
//
//  Created by Pranav on 23/10/25.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome")
                    .frame(maxHeight: .infinity)

                NavigationLink {
                    OnBoardingCompletedView()
                }label: {
                    Text("Get Started")
                        .callToAction()
                }
            }
            .padding()
        }
    }
}

#Preview {
    WelcomeView()
}
