//
//  OnBoardingColorView.swift
//  ChatterFly
//
//  Created by Pranav on 25/10/25.
//

import SwiftUI

struct OnBoardingColorView: View {
    @State private var selectedColor:Color?
    let profileColors: [Color] = [.green, .red, .pink, .blue, .mint, .purple, .cyan, .teal, .indigo]
    
    var body: some View {
        ScrollView{
            LazyVGrid(
                columns:Array(
                    repeating: GridItem(.flexible(),spacing: 16),
                    count: 3
                ),
                spacing: 16,
                pinnedViews: [.sectionHeaders]
            ) {
                Section {
                    ForEach(profileColors, id: \.self) { color in
                        Circle()
                            .fill(color)
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    selectedColor = color
                                }
                            }
                            .overlay {
                                if color == selectedColor {
                                    Circle()
                                        .stroke(
                                            Color.accentColor.opacity(0.8),
                                            lineWidth: 8
                                        )
                                        .shadow(radius: 3)
                                }
                            }
                    }
                } header: {
                    Text("Select a profile color")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(.horizontal, 24)
        }
        .safeAreaInset(edge: .bottom) {
            NavigationLink {
                OnBoardingCompletedView()
            } label: {
                Text("Get Started")
                    .callToAction()
            }
            .padding(24)
            .background(.ultraThinMaterial)
        }

        
    }
}

#Preview {
    NavigationStack{
        OnBoardingColorView()
    }
}
