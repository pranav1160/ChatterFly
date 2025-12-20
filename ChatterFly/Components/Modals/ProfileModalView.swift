//
//  ProfileModalView.swift
//  ChatterFly
//
//  Created by Pranav on 20/12/25.
//


import SwiftUI

struct ProfileModalView: View {
    var imageName: String? = Constants.randomImage
    var title: String? = "Alpha"
    var subtitle: String? = "Alien"
    var headline: String? = "An alien in the park."
    var onXMarkPressed: (() -> Void)? = {}

    var body: some View {
        VStack(spacing: 0) {

            if let imageName {
                ImageLoaderView(url: imageName)
                    .aspectRatio(1, contentMode: .fit)
            }

            VStack(alignment: .leading, spacing: 4) {

                if let title {
                    Text(title)
                        .font(.title)
                        .fontWeight(.semibold)
                }

                if let subtitle {
                    Text(subtitle)
                        .font(.title3)
                        .foregroundStyle(.secondary)
                }

                if let headline {
                    Text(headline)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
            .padding(24)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(.thinMaterial)
        .cornerRadius(16)
        .overlay(
            Image(systemName: "xmark.circle.fill")
                .font(.title)
                .foregroundStyle(Color.black)
                .padding(4)
                .clearTapBackGround()
                .anyButton {
                    onXMarkPressed?()
                }
                .padding(8),
            alignment: .topTrailing
        )
    }
}

#Preview {
    ZStack {
        Color.gray.opacity(0.2).ignoresSafeArea()

        ProfileModalView {
            print("X mark pressed")
        }
        .padding()
    }
}
