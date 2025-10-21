//
//  ViewBuilderCamp.swift
//  ChatterFly
//
//  Created by Pranav on 21/10/25.
//

import SwiftUI

struct HeaderViewBuilderCamp: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Title")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("subtitle is here dont worry")
                .font(.title3)
            
            Image(systemName: "heart.fill")
            
            Rectangle()
                .frame(height: 2)
        }
        .padding()
    }
}

struct CustomHStack<Content: View>: View {
    let content: Content
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        HStack {
            content
        }
    }
}

struct GenericHeaderViewBuilderCamp<Content: View>: View {
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Title")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            content
            
            Rectangle()
                .frame(height: 2)
        }
        .padding()
    }
}

struct CustomHeaderCamp: View {
    enum HeaderType {
        case one, two, three
    }
    let headerType: HeaderType
    
    var body: some View {
        VStack {
            switchableHeader
        }
    }
    
    @ViewBuilder private var switchableHeader: some View {
            switch headerType {
            case .one:
                header1
            case .two:
                header2
            case .three:
                header3
            }
        
    }
    
    private var header1: some View {
                Text("Title")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.opacity(0.1))
            
        }
    
    private var header2: some View {
        HStack {
            Text("Profile")
                .font(.title2)
                .fontWeight(.semibold)
            Spacer()
            Image(systemName: "gearshape.fill")
                .font(.title2)
        }
        .padding()
        .background(Color.green.opacity(0.2))
    }
    
    private var header3: some View {
        HStack {
            Image(systemName: "chevron.left")
                .font(.title2)
            Text("Settings")
                .font(.title2)
                .fontWeight(.medium)
            Spacer()
        }
        .padding()
        .background(Color.red.opacity(0.2))
    }
    
}

struct ViewBuilderCamp: View {
    var body: some View {
        VStack {
            CustomHeaderCamp(headerType: .two)
            
            Spacer()
        }
        
    }
}

#Preview {
    ViewBuilderCamp()
}
