//
//  CategoryCellView.swift
//  ChatterFly
//
//  Created by Pranav on 27/10/25.
//

import SwiftUI

struct CategoryCellView: View {
    var title:String = "Aliens"
    var imageName:String = Constants.randomImage
    var font : Font = .title2
    var cornerRadius:CGFloat = 16
    
    var body: some View {
        ImageLoaderView(url: imageName)
            .aspectRatio(1,contentMode: .fit)
            .overlay(alignment: .bottomLeading) {
                Text(title)
                    .font(font)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(15)
                    .background {
                        textBackGroundGradient()
                    }
            }
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            
        
    }
}

#Preview {
    VStack{
        CategoryCellView()
            .frame(width: 150)
        
        CategoryCellView()
            .frame(width: 250)
    }
}
