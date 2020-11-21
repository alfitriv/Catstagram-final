//
//  FeedList.swift
//  InstagramLikeApp
//
//  Created by Vania Radmila Alfitri on 08/11/20.
//

import SwiftUI

struct FeedList: View {
    var feedArray: [Feed]
    var body: some View {
        List(feedArray) { feed in
            FeedRow(feed: feed)
        }
    }
}

struct FeedList_Previews: PreviewProvider {
    static var previews: some View {
        FeedList(feedArray: feedData)
    }
}
