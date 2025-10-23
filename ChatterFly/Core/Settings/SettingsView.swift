//
//  SettingsView.swift
//  ChatterFly
//
//  Created by Pranav on 24/10/25.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(AppState.self) private var appstate
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Button {
                        onSignOutButtonPresses()
                    }label: {
                        Text("Sign Out")
                    }
                }
            }
        }
    }
    
    private func onSignOutButtonPresses() {
        dismiss()
        Task {
            try await Task.sleep(for: .seconds(1))
            appstate.updateViewState(showTabBarView: false)
        }
    }
}

#Preview {
    SettingsView()
        .environment(AppState(showTabBar: true))
}
