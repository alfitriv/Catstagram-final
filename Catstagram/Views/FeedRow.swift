//
//  FeedRow.swift
//  InstagramLikeApp
//
//  Created by Vania Radmila Alfitri on 01/11/20.
//

import SwiftUI

struct FeedRow: View {
    var feed: Feed
    @ObservedObject var imageLoader = ImageLoader()
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 16) {
                if self.imageLoader.image != nil {
                    Image(uiImage: imageLoader.image!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    
                }
                Text(feed.name)
                    .fontWeight(.bold)
            }
            if self.imageLoader.image != nil {
                Image(uiImage: imageLoader.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            UserInputRow()
            VStack(alignment: .leading, spacing: 8) {
                Text("\(feed.numOfLikes)" + " " + "likes")
                    .fontWeight(.bold)
                Text(feed.caption)
                    .fontWeight(.regular)
                Text("View all \(feed.comments.count) comments")
                    .fontWeight(.light)
            }
            .font(.system(size: 14))
        }
        .onAppear {
            self.imageLoader.getImage(from: URL(string: feed.picture)!) { (result) in
                switch result {
                case .success(let image):
                    print(image)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}

struct FeedRow_Previews: PreviewProvider {
    static var previews: some View {
        FeedRow(feed: feedData[0])
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
