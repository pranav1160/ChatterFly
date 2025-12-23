//
//  ProfileView.swift
//  ChatterFly
//
//  Created by Pranav on 23/10/25.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var showSettingsView = false
    @State private var showAvatarCreateView = false
    @State private var currentUser:User? = .mock
    @State private var avatars:[Avatar] = []
    @State private var isLoading:Bool = true
    
    @State private var path : [NavigationPathOption] = []
    
    var body: some View {
        
        NavigationStack(path: $path) {
            List{
                profileSection
                avatarSection
            }
            .navigationTitle("Profile")
            .navigationDestinationForCoreModule(path: $path)
            .task {
                await loadData()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    settingsButton
                }
            }
            .sheet(isPresented: $showSettingsView) {
                SettingsView()
            }
            .fullScreenCover(
                isPresented: $showAvatarCreateView
            ) {
                CreateAvatarView()
            }
        }
    }
    
    private func loadData() async {
        try? await Task.sleep(for: .seconds(1))
        isLoading = false
        avatars = Avatar.mocks
    }
    
    private var profileSection:some View{
        Section{
            ZStack{
                Circle()
                    .fill(currentUser?.profileColorCalculated ?? .accent)
            }
            .frame(width: 100,height: 100)
            .frame(maxWidth: .infinity,alignment: .center)
            .removeExtraListFormatting()
        }
    }
    
    private var avatarSection:some View{
        Section{
            if avatars.isEmpty{
                Group{
                    if isLoading{
                        ProgressView()
                    } else {
                        Text("Click + to create Avatars")
                    }
                }
                .padding(50)
                .frame(maxWidth: .infinity,alignment: .center)
                .font(.body)
                .foregroundStyle(.secondary)
                .removeExtraListFormatting()
                
            } else {
                ForEach(avatars,id: \.self) { avatar in
                    CustomListCellView(
                        imageName: avatar.profileImageName,
                        title: avatar.name,
                        subtitle: nil
                    )
                    .anyButton(style: .highlight) {
                        onAvatarPressed(avatar: avatar)
                    }
                }
                .onDelete(perform: { indexset in
                    onDeleteAvatar(indexSet: indexset)
                })
                .removeExtraListFormatting()
            }
        }header: {
            HStack{
                Text("MY AVATAR")
                    .font(.subheadline)
                
                Spacer()
                
                Image(systemName: "plus.circle.fill")
                    .foregroundStyle(Color.accent)
                    .font(.title)
                    .anyButton {
                        onAvatarCreateButtonPressed()
                    }
            }
        }
    }
    
    private var settingsButton: some View {
        Image(systemName: "gear")
            .anyButton {
                onSettingsButtonPressed()
            }
    }
    
    private func onSettingsButtonPressed() {
        showSettingsView = true
    }
    
    private func onAvatarCreateButtonPressed(){
        showAvatarCreateView = true
    }
    
    private func onAvatarPressed(avatar:Avatar){
        path.append(.chat(avatarId: avatar.avatarId))
    }
    
    private func onDeleteAvatar(indexSet:IndexSet){
        guard let index = indexSet.first else {return}
        avatars.remove(at: index)
    }
}

#Preview {
    ProfileView()
        .environment(AppState(showTabBar: true))
}
