//
//  GitService.swift
//  GitFollowers
//
//  Created by hajdu otto on 12/01/2023.
//

import Foundation

struct GitService {
    enum GitError : Error {
        case failed
        case failedToDecode
        case invalideStatusCode
        case invalideUserName
    }
    
    func fetchGitInfo(for username: String) async throws -> [Follower] {
        let baseUrl = "https://api.github.com/users/\(username)/followers"
        
        guard let url = URL(string: baseUrl) else {
            throw GitError.invalideUserName
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
            throw GitError.invalideStatusCode
        }
        
        let decodeData = try JSONDecoder().decode([Follower].self, from: data)
        
        return decodeData
    }
}
