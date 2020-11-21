//
//  ContentView.swift
//  InstagramLikeApp
//
//  Created by Vania Radmila Alfitri on 01/11/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var postState = PostState()
    @State var showNewPost = false
    var body: some View {
        TabView() {
            NavigationView {
                FeedList(feedArray: postState.injectedFeed)
                    .navigationBarTitle("Catstagram", displayMode: .inline)
            }
            .tabItem {
                Image(systemName: "plus")
            }
        }
        .onTapGesture {
            self.showNewPost.toggle()
        }
        .fullScreenCover(isPresented: $showNewPost) {
            NewPostView(postState: postState)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
