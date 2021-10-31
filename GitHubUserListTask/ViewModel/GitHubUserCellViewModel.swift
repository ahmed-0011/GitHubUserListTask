//
//  GitHubUserListViewModel.swift
//  GithubUserListTask
//
//  Created by ahmed on 28/10/2021.
//

import Foundation
import UIKit

class GitHubUserCellViewModel {
  
    var image: UIImage {
        didSet {
            image = image.af.imageRoundedIntoCircle()
        }
    }
    var username: String
    var name: String {
        didSet {
            name = "Name".localized  + name
        }
    }
    var company: String {
        didSet {
            company = "Company".localized + company
        }
    }
    var blog: String {
        didSet {
            blog = "Blog".localized + blog
        }
    }
    var location: String {
        didSet {
            location = "Location".localized + location
        }
    }
    var repositories: String {
        didSet {
            repositories = "Repositories".localized + repositories
        }
    }
    var followers: String {
        didSet {
            followers = "Followers".localized + followers
        }
    }
    var following: String {
        didSet {
            following = "Following".localized + following
        }
    }
    
    init(gitHubUser: GitHubUser) {
        image = gitHubUser.image ?? UIImage(named: "User")!
        defer { image = gitHubUser.image ?? UIImage(named: "User")! }
        username = gitHubUser.username ?? "Not Available".localized
        name = gitHubUser.info?.name ?? "Not Available".localized
        defer { name = gitHubUser.info?.name ?? "Not Available".localized }
        company = gitHubUser.info?.company ?? "Not Available".localized
        defer { company = gitHubUser.info?.company ?? "Not Available".localized }
        blog = gitHubUser.info?.blog ?? "Not Available".localized
        defer { blog = gitHubUser.info?.blog ?? "Not Available".localized }
        location = gitHubUser.info?.location ?? "Not Available".localized
        defer { location = gitHubUser.info?.location ?? "Not Available".localized }
        repositories = "\(gitHubUser.info?.numOfRepositories ?? 0)"
        defer { repositories = "\(gitHubUser.info?.numOfRepositories ?? 0)" }
        followers = "\(gitHubUser.info?.numOfFollowers ?? 0)"
        defer { followers = "\(gitHubUser.info?.numOfFollowers ?? 0)" }
        following = "\(gitHubUser.info?.numOfFollowing ?? 0)"
        defer { following = "\(gitHubUser.info?.numOfFollowing ?? 0)" }
    }    
}
