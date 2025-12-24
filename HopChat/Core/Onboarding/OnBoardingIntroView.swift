//
//  OnBoardingIntoView.swift
//  ChatterFly
//
//  Created by Pranav on 25/10/25.
//

import SwiftUI

struct OnBoardingIntroView: View {
    var body: some View {
        VStack {
            
            Text("""
            Make your own \(Text("avatars").foregroundStyle(.accent).fontWeight(.semibold)) and chat with them!
            
            Have \(Text("real conversations").foregroundStyle(.accent).fontWeight(.semibold)) with AI generated responses
            """)
            .baselineOffset(6)
            .padding(24)
            .frame(maxHeight: .infinity)
            
            NavigationLink {
                OnBoardingColorView()
            } label: {
                Text("Get Started")
                    .callToAction()
            }
        }
        .padding(24)
        .font(.title2)
        .toolbarVisibility(.hidden, for: .navigationBar)
    }
}

#Preview {
    NavigationStack{
        OnBoardingIntroView()
    }
    .environment(AppState())
}
