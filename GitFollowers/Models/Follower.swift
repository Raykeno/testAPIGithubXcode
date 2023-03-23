//
//  Follower.swift
//  GitFollowers
//
//  Created by hajdu otto on 12/01/2023.
//

import Foundation

struct Follower: Codable, Hashable {
    var login: String
    var avatar_url: URL
}

struct FollowerResponse: Decodable {
    var results: [Follower]
}
