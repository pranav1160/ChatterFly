//
//  CarouselView.swift
//  ChatterFly
//
//  Created by Pranav on 26/10/25.
//

import SwiftUI

struct CarouselView<Content:View,T:Hashable> : View {
    
    @State private var scrollIndex: Int? = 0
    var items: [T]
    @ViewBuilder var content:(T) -> Content
    
    var body: some View {
        VStack(spacing: 10) {
            carousel
            
            HStack {
                ForEach(items.indices, id: \.self) { id in
                    Circle()
                        .fill(scrollIndex == id ? Color.accentColor : .black.opacity(0.3))
                        .frame(width: 10, height: 10)
                }
            }
            .animation(.easeInOut, value: scrollIndex)
        }
        .onAppear {
            resetIfAtEnd()
        }
    }
    
    private var carousel: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 0) {
                ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                    content(item)
                    .id(index)
                    .scrollTransition(.interactive.threshold(.visible(0.95))) { content, phase in
                        content.scaleEffect(phase.isIdentity ? 1 : 0.9)
                    }
                    .containerRelativeFrame(.horizontal, alignment: .center)
                }
            }
            .scrollTargetLayout()
        }
        .frame(height: 200)
        .scrollIndicators(.hidden)
        .scrollTargetBehavior(.paging)
        .scrollPosition(id: $scrollIndex, anchor: .center)
    }
    
    private func resetIfAtEnd() {
        if scrollIndex == items.count - 1 {
            scrollIndex = 0
        }
    }
}

#Preview {
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
}
