//
//  NetworkingManager.swift
//  GithubUserListTask
//
//  Created by ahmed on 26/10/2021.
//

import Foundation
import UIKit
import Alamofire
import AlamofireImage

class NetworkingService {
    
    static let shared = NetworkingService()
    let api = "https://api.github.com/users?since="
    
    private init() {}
    
    func fetchUsers(index: Int, completion: @escaping ([GitHubUser]) -> ()) {
        
        let dispatchGroup = DispatchGroup()
        let queue = DispatchQueue(label: "queue", qos: .background)
        
        var gitHubUsers: [GitHubUser] = []
        AF.request(api + "\(index)")
            .validate()
            .responseDecodable(of: [GitHubUser].self) { response in
                if let users = response.value {
                    gitHubUsers = users
                }
                
                // to prevent trying fetch non existent information and image of non existient users.
                if gitHubUsers == [] {
                    completion(gitHubUsers)
                    return
                }
                
                for i in 0...gitHubUsers.count - 1 {
                    dispatchGroup.enter()
                    dispatchGroup.enter()
                    queue.async {
                        self.downloadImage(imageURL: gitHubUsers[i].imageURL ?? "") { image in
                            gitHubUsers[i].image = image
                            dispatchGroup.leave()
                        }
                        self.getUserInfo(infoURL: gitHubUsers[i].url) { userInfo in
                            gitHubUsers[i].info = userInfo
                            dispatchGroup.leave()
                        }
                    }
                }
                dispatchGroup.notify(queue: .main, execute: {
                    completion(gitHubUsers)
                })
            }
    }
    
    func getUserInfo(infoURL: String?, completion: @escaping (GitHubUserInfo) -> ()) {
        
       var gitHubUserInfo = GitHubUserInfo(
        name: "Not Available".localized, company: "Not Available".localized, blog: "Not Available".localized, location: "Not Available".localized, email: "Not Available".localized,
            hireable: "Not Available".localized, bio: "Not Available".localized, twitterUsername: "Not Available".localized, numOfRepositories: 0, numOfGists: 0,
            numOfFollowers: 0, numOfFollowing: 0, createdAt: "Not Available".localized, updatedAt: "Not Available".localized)
        
        AF.request(infoURL ?? "")
            .validate()
            .responseDecodable(of: GitHubUserInfo.self) { response in
                if let info = response.value {
                    gitHubUserInfo = info
                }
                completion(gitHubUserInfo)
            }
    }
    
    func downloadImage(imageURL: String, completion: @escaping (UIImage) -> ()) {
        var image = UIImage(named: "User")!
        let downloader = ImageDownloader()
        let urlRequest = URLRequest(url: URL(string: imageURL)!)

        downloader.download(urlRequest, completion:  { response in
            if let userImage = response.value {
                image = userImage
            }
            completion(image)
        })
    }
}
