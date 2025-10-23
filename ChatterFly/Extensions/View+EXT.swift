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
}
