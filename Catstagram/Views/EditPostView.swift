//
//  EditPostView.swift
//  InstagramLikeApp
//
//  Created by Vania Radmila Alfitri on 19/11/20.
//

import SwiftUI
import Firebase
import UIKit

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
                    let data = (self.image.jpegData(compressionQuality: 0.5))!
                    let storage = Storage.storage()
                    let storageRef = storage.reference()
                    let imageRef = storageRef.child("images/sample1.jpg")
                    
                    // Upload the file to the path "images/sample.jpg"
                    imageRef.putData(data, metadata: nil) { (metadata, error) in
                      guard metadata != nil else {
                        // Uh-oh, an error occurred!
                        return
                      }
                      // Download URL after upload.
                      imageRef.downloadURL { (url, error) in
                        guard let downloadURL = url else {
                          // Uh-oh, an error occurred!
                          return
                        }
                        postState.addPost(feed: Feed(id: "841", name: "Puput", picture: "\(downloadURL)", numOfLikes: 0, caption: caption, comments: [""]))
                      }
                    }
                    
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
