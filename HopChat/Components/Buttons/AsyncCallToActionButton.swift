//
//  AsyncCallToActionButton.swift
//  ChatterFly
//
//  Created by Pranav on 02/12/25.
//

import SwiftUI

struct AsyncCallToActionButton: View {
    var isLoading:Bool = false
    var title:String
    var action:() -> Void
    var body: some View {
        ZStack{
            if isLoading{
                ProgressView()
                    .tint(.white)
            } else{
                Text(title)
            }
        }
        .callToAction()
        .anyButton(style: .pressable) {
            action()
        }
        .disabled(isLoading == true)
        .padding(24)
        .background(.ultraThinMaterial)
    }
}

#Preview {
    AsyncCallToActionButton(isLoading: true, title: "Finish", action:{})
}
