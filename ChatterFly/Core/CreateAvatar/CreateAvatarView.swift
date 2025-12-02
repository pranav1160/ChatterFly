//
//  CreateAvatarView.swift
//  ChatterFly
//
//  Created by Pranav on 02/12/25.
//

import SwiftUI

struct CreateAvatarView: View {
    
    @State private var avatarName:String = ""
    @State private var characterOption:CharacterOption = .defaultCharacter
    @State private var characterAction:CharacterAction = .defaultAction
    @State private var characterLocation:CharacterLocation = .defaultLocation
    @State private var isGenerating:Bool = false
    @State private var generatedImage:UIImage?
    @State private var isSaving:Bool = false
    
    @Environment(\.dismiss) var dismiss
    
    private var nameSection:some View{
        Section {
            TextField("Player 1...", text: $avatarName)
        } header: {
            Text("NAME YOUR AVATAR*")
                .font(.caption)
        }
    }
    
    private var attributesSection:some View{
        Section {
            Picker(selection: $characterOption) {
                ForEach(CharacterOption.allCases, id: \.self) { option in
                    Text(option.rawValue.capitalized)
                        .tag(option)
                }
            } label: {
                Text("is a...")
            }
            
            Picker(selection: $characterAction) {
                ForEach(CharacterAction.allCases, id: \.self) { option in
                    Text(option.rawValue.capitalized)
                        .tag(option)
                }
            } label: {
                Text("that is...")
            }
            
            Picker(selection: $characterLocation) {
                ForEach(CharacterLocation.allCases, id: \.self) { option in
                    Text(option.rawValue.capitalized)
                        .tag(option)
                }
            } label: {
                Text("in the...")
            }
            
        } header: {
            Text("ATTRIBUTES")
        }
    }
    
    private var backButton:some View{
        //backbutton
        Image(systemName: "xmark")
            .font(.title2)
            .fontWeight(.semibold)
            .anyButton(style: .plain, action: {
                onBackButtonPressed()
            })
    }
    
    private func onGenerateImageButtonPressed(){
        isGenerating = true
        
        Task{
            try? await Task.sleep(for: .seconds(2))
            generatedImage = UIImage(systemName: "star.fill")
            isGenerating = false
        }
    }
    
    private var imageSection:some View {
        //imagenerate
        HStack(alignment: .top ,spacing:8){
            ZStack{
                Text("Generate Image")
                    .underline()
                    .foregroundStyle(.accent)
                    .anyButton(style: .plain, action: {
                        onGenerateImageButtonPressed()
                    })
                    .opacity(isGenerating ? 0 : 1)
                    .disabled(avatarName.isEmpty)
                
                ProgressView()
                    .opacity(isGenerating ? 1 : 0)
            }
            
            
            Circle()
                .fill(Color.secondary.opacity(0.3))
                .overlay {
                    ZStack{
                        if let generatedImage{
                            Image(uiImage: generatedImage)
                                .resizable()
                                .scaledToFill()
                        }
                    }
                }
                .clipShape(.circle)
            
        }
        .padding()
        .removeExtraListFormatting()
        
    }
    
    private var saveSection: some View{
        AsyncCallToActionButton(isLoading: isSaving, title: "Save") {
            onSaveClicked()
        }
        .disabled(generatedImage == nil)
        .opacity( generatedImage == nil ? 0.5 : 1)
        .removeExtraListFormatting()
    }
    
    private func onSaveClicked(){
        isSaving = true
        
        Task{
            try? await Task.sleep(for: .seconds(2))
            dismiss()
            isSaving = false
        }
    }
    
    private func onBackButtonPressed(){
        dismiss()
    }
    
    var body: some View {
        NavigationStack{
            List{
                
                nameSection
                
                attributesSection
                
                imageSection
                    
                saveSection
                
                
            }
            .navigationTitle("Create Avatar")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    backButton
                }
            }
        }
        
    }
    
   
    
}

#Preview {
    CreateAvatarView()
}
