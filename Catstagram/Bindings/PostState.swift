//
//  PostState.swift
//  InstagramLikeApp
//
//  Created by Vania Radmila Alfitri on 20/11/20.
//

import Foundation

class PostState: ObservableObject {
    @Published var injectedFeed = feedData
    
    func addPost(feed: Feed) {
        injectedFeed.append(feed)
    }
}
