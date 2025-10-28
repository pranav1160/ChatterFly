//
//  View+EXT.swift
//  ChatterFly
//
//  Created by Pranav on 24/10/25.
//

import SwiftUI

extension View {
    func callToAction() -> some View {
        self
            .font(.headline)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(.red)
            .clipShape(RoundedRectangle(cornerRadius: 15))
    }
    
    func clearTapBackGround() -> some View {
        self
            .background(Color.black.opacity(0.001))
    }
    
    func removeExtraListFormatting() -> some View{
        self
            .listRowInsets(EdgeInsets())
            .listRowBackground(Color.clear)
    }
    
    func textBackGroundGradient() -> some View{
        LinearGradient(
            colors: [
                Color.black.opacity(0.1),
                Color.black.opacity(0.3),
                Color.black.opacity(0.4)
            ],
            startPoint: .top,
            endPoint: .bottom
        )
    }
}
