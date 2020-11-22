//
//  ImageFilterView.swift
//  Catstagram
//
//  Created by Vania Radmila Alfitri on 22/11/20.
//

import SwiftUI
import GPUImage

struct ImageFilterView: View {
    var image: UIImage
    @ObservedObject var filteredImageState: FilteredImageState
    @ObservedObject var postState: PostState
    @State var isShowEditView = false
    @State var selectedFilteredImage: UIImage
    @Binding var onClick: OnClickHandler
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            Image(uiImage: self.selectedFilteredImage)
                .resizable()
                .scaledToFit()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(self.filteredImageState.filteredImages, id: \.cgImage) { image in
                        Button(action: {
                            self.selectedFilteredImage = image
                        }) {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                        }
                    }
                }
            }
            Button(action: {
                self.isShowEditView = true
            }) {
                HStack {
                    Image(systemName: "arrow.right.circle")
                        .font(.system(size: 20))
                    Text("Next")
                        .font(.headline)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(20)
                .padding(.horizontal)
            }
            NavigationLink(
                destination: EditPostView(image: self.selectedFilteredImage, postState: postState, onClick: $onClick),
                isActive: $isShowEditView,
                label: {

                })
        }
        .onAppear {
            filteredImageState.filterImage(image: image)
        }
    }
}
