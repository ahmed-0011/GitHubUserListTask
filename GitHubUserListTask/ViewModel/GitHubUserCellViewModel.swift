//
//  GitHubUserListViewModel.swift
//  GithubUserListTask
//
//  Created by ahmed on 28/10/2021.
//

import Foundation
import UIKit

class GitHubUserCellViewModel {
  
    var image: UIImage
    var username: String
    var name: String
    var company: String
    var blog: String
    var location: String
    var repositories: String
    var followers: String
    var following: String
    
    init(gitHubUser: GitHubUser) {
        image = gitHubUser.image!.af.imageRoundedIntoCircle()
        username = gitHubUser.username ?? "Not Available".localized
        name = "Name".localized + (gitHubUser.info?.name ?? "Not Available".localized)
        company = "Company".localized + (gitHubUser.info?.company ?? "Not Available".localized)
        blog = "Blog".localized + (gitHubUser.info?.blog ?? "Not Available".localized)
        location = "Location".localized + (gitHubUser.info?.location ?? "Not Available".localized)
        repositories = "Repositories".localized + "\(gitHubUser.info?.numOfRepositories ?? 0)"
        followers = "Followers".localized + "\(gitHubUser.info?.numOfFollowers ?? 0)"
        following = "Following".localized + "\(gitHubUser.info?.numOfFollowing ?? 0)"
    }
}
