//
//  ChatRowCellView.swift
//  ChatterFly
//
//  Created by Pranav on 30/10/25.
//

import SwiftUI

struct ChatRowCellView: View {
    var title:String? = "Alpha"
    var subtitle:String? = "This is the last message from alpha"
    var profileImage:String? = Constants.randomImage
    var isLastMessage:Bool = false
    
    var body: some View {
        HStack{
            ZStack{
                if let profileImage{
                    ImageLoaderView(url: profileImage)
                } else {
                    Circle()
                        .fill(Color.secondary)
                }
            }
            .frame(width: 50,height: 50)
            .clipShape(Circle())
            
            VStack(alignment:.leading){
                if let title{
                    Text(title)
                        .font(.headline)
                }
                
                if let subtitle{
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            
            Spacer()
            
            if isLastMessage{
                Text("NEW")
                    .font(.caption)
                    .foregroundStyle(.white)
                    .padding(.vertical,6)
                    .padding(.horizontal,8)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                    .padding()
            }
            
        }
        .padding(.vertical,8)
    }
}

#Preview {
    VStack{
        
        List {
            ChatRowCellView( isLastMessage: true)
                .removeExtraListFormatting()
           
            ChatRowCellView(subtitle: nil)
                .removeExtraListFormatting()
            ChatRowCellView(profileImage:nil)
                .removeExtraListFormatting()
        }
        
    }
}
