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
        NavigationView {
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
                    //imageFilterState.filterImage(image: self.image)
                    self.isShowEditView = true
                }, label: {
                    Text("Next")
                })
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
}

//struct ImageFilterView_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageFilterView(image: UIImage(named: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQo4BQSpilYy5KuAptMxbOAxm4uKjFYDG6_wg&usqp=CAU")!, filteredImages: [], filteredImageState: FilteredImageState())
//    }
//}
