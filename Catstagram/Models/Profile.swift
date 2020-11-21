//
//  Profile.swift
//  InstagramLikeApp
//
//  Created by Vania Radmila Alfitri on 01/11/20.
//

import Foundation

struct Profile {
    var name: String
    var followers: Int
    var following: Int
    var bio: String
    var followedBy: [String]
    var posts: [Feed]
}
