//
//  CustomListCellView.swift
//  ChatterFly
//
//  Created by Pranav on 27/10/25.
//

import SwiftUI

struct CustomListCellView: View {
    var imgName:String? = Constants.randomImage
    var title:String? = "Alien"
    var subTitle:String? = "An alien is eating your brains"
    var body: some View {
        HStack{
            //image
            ZStack{
                if imgName != nil{
                    ImageLoaderView()
                } else{
                    Rectangle()
                        .fill(Color.accent)
                }
            }
                .aspectRatio(1,contentMode: .fit)
                .frame(width: 80)
                .clipShape(RoundedRectangle(cornerRadius: 18))
            VStack(alignment: .leading) {
                //title
                if let title{
                    Text(title)
                        .font(.headline)
                        .fontWeight(.semibold)
                }
                //subtitle
                if let subTitle{
                    Text(subTitle)
                        .font(.subheadline)
                }
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            
        }
        .padding()
    }
}

#Preview {
    
    VStack{
        CustomListCellView()
        CustomListCellView(imgName: nil)
        CustomListCellView(subTitle: nil)
        CustomListCellView(title: nil)
    }
    
}
