//
//  FollowersListView.swift
//  GitFollowers
//
//  Created by hajdu otto on 12/01/2023.
//

import SwiftUI

struct FollowersListView: View {
    
    @StateObject var viewModel = GitViewModel()
    var userName: String
    
    var body: some View {
        VStack {
            switch viewModel.state {
                case .success(let followers):
                    ForEach(followers, id: \.self) { follower in
                        AsyncImage(url: follower.avatar_url){
                            image in image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                        } placeholder: {
                            ProgressView()
                        }
                        Text(follower.login)
                    }
                case .loading:
                    ProgressView()
            default:
                EmptyView()
                
            }
        }
        .task {
            await viewModel.getFollowers(from: userName)
        }
    }
}

struct FollowersListView_Previews: PreviewProvider {
    static var previews: some View {
        FollowersListView(userName: "Raykeno")
    }
}
