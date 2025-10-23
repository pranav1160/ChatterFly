//
//  ProfileView.swift
//  ChatterFly
//
//  Created by Pranav on 23/10/25.
//

import SwiftUI

struct ProfileView: View {
    @State private var showSettings = false
    var body: some View {
        NavigationStack {
            Text("Profile")
                .navigationTitle("Profile")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        settingsButton
                    }
                }
                .sheet(isPresented: $showSettings) {
                    Text("Settings")
                }
        }
    }
    
    private var settingsButton: some View {
        Button {
            onSettingsButtonPressed()
        } label: {
            Image(systemName: "gear")
        }
    }
    
    private func onSettingsButtonPressed() {
        showSettings = true
    }
}

#Preview {
    ProfileView()
}
