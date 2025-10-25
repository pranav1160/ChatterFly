//
//  ImageLoaderView.swift
//  ChatterFly
//
//  Created by Pranav on 24/10/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
    var contentMode: ContentMode = .fill
    var url: String = Constants.randomImage
    var body: some View {
        Rectangle()
            .opacity(0)
            .overlay {
                WebImage(url: URL(string: url))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: contentMode)
                    .allowsHitTesting(false)
            }
            .clipped()
    }
}

#Preview {
    ImageLoaderView()
        .frame(width: 100, height: 200)
}
