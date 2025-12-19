//
//  CustomBinding.swift
//  ChatterFly
//
//  Created by Pranav on 19/12/25.
//
import SwiftUI


extension Binding where Value == Bool {
    
    init<T>(value: Binding<T?>) {
        self.init {
            value.wrappedValue != nil
        } set: { newValue in
            if !newValue {
                value.wrappedValue = nil
            }
        }
    }
}


struct CustomBinding:View{
    
    @State private var alertTitle:String?
 
    
    var body: some View{
        VStack{
            Button{
              
                alertTitle = "This Error"
            }label: {
                Text("CLICK ME!!")
            }
            .buttonStyle(.borderedProminent)
            
        }
 
        .alert(
            alertTitle ?? "ERROR",
            isPresented: Binding(value: $alertTitle)) {
                Button{}label: {
                    Text("OK")
                }
            }
    }
}


#Preview {
    CustomBinding()
}
