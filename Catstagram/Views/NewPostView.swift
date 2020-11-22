//
//  NewPostView.swift
//  InstagramLikeApp
//
//  Created by Vania Radmila Alfitri on 19/11/20.
//

import SwiftUI

typealias OnClickHandler = (() -> Void)

struct NewPostView: View {
    @State private var isShowPhotoLibrary = false
    @State private var isShowEditView = false
    @State private var isShowFilterView = false
    @State private var image = UIImage()
    @State var onClick: OnClickHandler = { }
    @ObservedObject var postState: PostState
    @ObservedObject var imageFilterState = FilteredImageState()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView {
            VStack {
                Image(uiImage: self.image)
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.all)
                
                Button(action: {
                    self.isShowPhotoLibrary = true
                }) {
                    HStack {
                        Image(systemName: "photo")
                            .font(.system(size: 20))
                        
                        Text("Photo library")
                            .font(.headline)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .padding(.horizontal)
                }
                NavigationLink(
                    destination: ImageFilterView(image: self.image, filteredImageState: imageFilterState, postState: self.postState, selectedFilteredImage: self.image, onClick: $onClick),
                    isActive: $isShowFilterView,
                    label: {
                    })
            }
            .navigationBarTitle("New post")
            .navigationBarItems(trailing: Button(action: {
                self.isShowFilterView = true
            }, label: {
                Text("Next")
            }))
            .sheet(isPresented: $isShowPhotoLibrary) {
                ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
            }
        }
        .onAppear {
            self.onClick = {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView(postState: PostState())
    }
}
