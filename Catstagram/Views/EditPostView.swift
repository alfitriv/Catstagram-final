//
//  EditPostView.swift
//  InstagramLikeApp
//
//  Created by Vania Radmila Alfitri on 19/11/20.
//

import SwiftUI

struct EditPostView: View {
    var image: UIImage
    @ObservedObject var postState: PostState
    @State private var caption: String = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var onClick: OnClickHandler
    
    var body: some View {
        VStack {
            HStack {
                Image(uiImage: self.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                TextField("Enter caption", text: $caption, onCommit: {
                    postState.addPost(feed: Feed(id: "841", name: "Puput", picture: "https://firebasestorage.googleapis.com/v0/b/self-care-app-b258e.appspot.com/o/articles%2FGlimmr-Fivyolen.jpg?alt=media&token=ee8a04bb-460c-4517-9a3f-e4f485bae69a", numOfLikes: 0, caption: caption, comments: [""]))
                })
            }
            Button(action: onClick) {
                Text("Submit")
                
            }

        }
    }
}

//struct EditPostView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditPostView(image: UIImage(named: "")!, postState: PostState(), onClick: OnClickHandle)
//    }
//}
