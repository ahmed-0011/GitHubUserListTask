//
//  GitHubUserInfoCell.swift
//  GithubUserListTask
//
//  Created by ahmed on 28/10/2021.
//

import Foundation

class GitHubUserInfoCellViewModel {
   
    var info: String {
        didSet {
            switch row {
            case 0:
                info = "Name".localized + "\(gitHubUser.info?.name ?? "Not Available".localized)"
            case 1:
                info = "Link".localized + "\(gitHubUser.link ?? "Not Available".localized)"
            case 2:
                info = "Email".localized + "\(gitHubUser.info?.email ?? "Not Available".localized)"
            case 3:
                info = "Blog".localized + "\(gitHubUser.info?.blog ?? "Not Available".localized)"
            case 4:
                info = "Twitter".localized + "\(gitHubUser.info?.twitterUsername ?? "Not Available".localized)"
            case 5:
                info = "Bio".localized + "\(gitHubUser.info?.bio ?? "Not Available".localized)"
            case 6:
                info = "Location".localized + "\(gitHubUser.info?.location ?? "Not Available".localized)"
            case 7:
                info = "Company".localized + "\(gitHubUser.info?.company ?? "Not Available".localized)"
            case 8:
                info = "Hierable".localized + "\(gitHubUser.info?.hireable ?? "Unknown".localized)"
            case 9:
                info = "Public Repositories".localized + "\(gitHubUser.info?.numOfRepositories ?? 0)"
            case 10:
                info = "Public Gists".localized + "\(gitHubUser.info?.numOfGists ?? 0)"
            case 11:
                info = "Followers".localized + "\(gitHubUser.info?.numOfFollowers ?? 0)"
            case 12:
                info = "Following".localized + "\(gitHubUser.info?.numOfFollowing ?? 0)"
            case 13:
                info = "Updated At".localized + "\(gitHubUser.info?.updatedAt ?? "Not Available".localized)"
            case 14:
                info = "Created At".localized + "\(gitHubUser.info?.createdAt ?? "Not Available".localized)"
            default:
                break
            }
        }
    }
    var gitHubUser: GitHubUser
    var row: Int
    static let numOfRows: Int = 15
    
    init(gitHubUser: GitHubUser, row: Int) {
        self.gitHubUser = gitHubUser
        self.row = row
        self.info = ""
        defer { info = "" }
    }
}
