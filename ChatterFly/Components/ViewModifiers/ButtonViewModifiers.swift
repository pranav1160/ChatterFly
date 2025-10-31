//
//  ButtonViewModifiers.swift
//  ChatterFly
//
//  Created by Pranav on 28/10/25.
//

import SwiftUI

struct HighlightButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .overlay {
                configuration.isPressed ? Color.accent.opacity(0.4) : Color.accent.opacity(0)
            }
            .animation(.smooth, value: configuration.isPressed)
    }
}


struct PressableButtonStyle:ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .animation(.smooth, value: configuration.isPressed)
    }
}

enum ButtonStyleOption{
    case highlight,pressable,plain
}


extension View{
    
    @ViewBuilder
    func anyButton(
        style : ButtonStyleOption = .plain ,
        action : @escaping () -> Void
    ) -> some View {
        switch style {
        case .highlight:
            self
                .highlightButtonStyle{
                    action()
                }
        case .pressable:
            self
                .makePressableStyle{
                action()
            }
        case .plain:
            self
                .makePlainStyle {
                    action()
                }
        
        }
    }
    
    private func makePlainStyle(action : @escaping () -> Void) -> some View{
        Button{
            action()
        }label: {
            self
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    private func makePressableStyle(action : @escaping () -> Void) -> some View{
        Button{
            action()
        }label: {
            self
        }
        .buttonStyle(PressableButtonStyle())
    }
    
    private func highlightButtonStyle(action:@escaping () -> Void) -> some View{
        Button{
            action()
        }label: {
            self
        }
        .buttonStyle(HighlightButtonStyle())
    }
}




#Preview {
    
    VStack(spacing:10){
        
        Text("Boxing")
            .font(.headline)
            .foregroundStyle(.black)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .anyButton(style: .highlight) {
                print("highlighted bro.......")
            }
            
            
        Text("hello world")
            .callToAction()
            .anyButton(style: .pressable) {
                print("pressed bro.......")
            }
        
        Text("Plain world")
            .callToAction()
            .anyButton {
                print("pressed bro.......")
            }
    }
    .padding()
}
