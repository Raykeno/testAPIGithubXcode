//
//  GitViewModel.swift
//  GitFollowers
//
//  Created by hajdu otto on 12/01/2023.
//

import Foundation

@MainActor
class GitViewModel: ObservableObject {
    enum State {
        case notAvailable
        case loading
        case success(data: [Follower])
        case failed(error: Error)
    }
    
    @Published var state: State = .notAvailable
    @Published var hasError: Bool = false
    
    private let service = GitService()
    
    func getFollowers(from userName: String) async {
        self.state = .loading
        self.hasError = false
        do {
            let followers = try await service.fetchGitInfo(for: userName)
            self.state = .success(data: followers)
        } catch {
            self.state = .failed(error: error)
            self.hasError = true
            print(error)
        }
    }
}
