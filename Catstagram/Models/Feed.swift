//
//  Feed.swift
//  InstagramLikeApp
//
//  Created by Vania Radmila Alfitri on 01/11/20.
//

import Foundation
import UIKit

struct Feed: Hashable, Codable, Identifiable {
    var id: String
    var name: String
    var picture: String
    var numOfLikes: Int
    var caption: String
    var comments: [String]
}
