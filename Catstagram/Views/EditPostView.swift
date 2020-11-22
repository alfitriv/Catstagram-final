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
                    let imageRef = storageRef.child("images/\(UUID().uuidString).jpg")
                    
                    imageRef.putData(data, metadata: nil) { (metadata, error) in
                      guard metadata != nil else {
                        return
                      }
                      
                      imageRef.downloadURL { (url, error) in
                        guard let downloadURL = url else {
                          return
                        }
                        postState.addPost(feed: Feed(id: "\(UUID().uuidString)", name: "Puput", picture: "\(downloadURL)", numOfLikes: 0, caption: caption, comments: [""]))
                      }
                    }
                    
                })
            }
            .padding()
            Button(action: onClick) {
                HStack {
                    Text("Submit")
                        .font(.headline)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(20)
                .padding(.horizontal)
            }

        }
    }
}
