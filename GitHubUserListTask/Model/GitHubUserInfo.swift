//
//  GitHubUserInfo.swift
//  GithubUserListTask
//
//  Created by ahmed on 26/10/2021.
//

import Foundation

class GitHubUserInfo: NSObject, NSSecureCoding, Decodable {
    
    static var supportsSecureCoding: Bool {
        return true
    }
    let name: String?
    let company: String?
    let blog: String?
    let location: String?
    let email: String?
    let hireable: String?
    let bio: String?
    let twitterUsername: String?
    let numOfRepositories: Int?
    let numOfGists: Int?
    let numOfFollowers: Int?
    let numOfFollowing: Int?
    let createdAt: String?
    let updatedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case company = "company"
        case blog = "blog"
        case location = "location"
        case email = "email"
        case hireable = "hireable"
        case bio = "bio"
        case twitterUsername = "twitter_username"
        case numOfRepositories = "public_repos"
        case numOfGists = "public_gists"
        case numOfFollowers = "followers"
        case numOfFollowing = "following"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
    
    init(name: String?, company: String?, blog: String?, location: String?, email: String?, hireable: String?, bio: String?, twitterUsername: String?, numOfRepositories: Int?, numOfGists: Int?, numOfFollowers: Int?, numOfFollowing: Int?, createdAt: String?, updatedAt: String?) {
        self.name = name
        self.company = company
        self.blog = blog
        self.location = location
        self.email = email
        self.hireable = hireable
        self.bio = bio
        self.twitterUsername = twitterUsername
        self.numOfRepositories = numOfRepositories
        self.numOfGists = numOfGists
        self.numOfFollowers = numOfFollowers
        self.numOfFollowing = numOfFollowing
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
    
    
    // MARK: - Encoding for CoreData
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: CodingKeys.name.rawValue)
        coder.encode(company, forKey: CodingKeys.company.rawValue)
        coder.encode(blog, forKey: CodingKeys.blog.rawValue)
        coder.encode(location, forKey: CodingKeys.location.rawValue)
        coder.encode(email, forKey: CodingKeys.email.rawValue)
        coder.encode(hireable, forKey: CodingKeys.hireable.rawValue)
        coder.encode(bio, forKey: CodingKeys.bio.rawValue)
        coder.encode(twitterUsername, forKey: CodingKeys.twitterUsername.rawValue)
        coder.encode(numOfRepositories, forKey: CodingKeys.numOfRepositories.rawValue)
        coder.encode(numOfGists, forKey: CodingKeys.numOfGists.rawValue)
        coder.encode(numOfFollowers, forKey: CodingKeys.numOfFollowers.rawValue)
        coder.encode(numOfFollowing, forKey: CodingKeys.numOfFollowing.rawValue)
        coder.encode(createdAt, forKey:CodingKeys.createdAt.rawValue)
        coder.encode(updatedAt, forKey: CodingKeys.updatedAt.rawValue)
    }
    
    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: CodingKeys.name.rawValue) as? String
        company = coder.decodeObject(forKey: CodingKeys.company.rawValue) as? String
        blog = coder.decodeObject(forKey: CodingKeys.blog.rawValue) as? String
        location = coder.decodeObject(forKey: CodingKeys.location.rawValue) as? String
        email = coder.decodeObject(forKey: CodingKeys.email.rawValue) as? String
        hireable = coder.decodeObject(forKey: CodingKeys.hireable.rawValue) as? String
        bio = coder.decodeObject(forKey: CodingKeys.bio.rawValue) as? String
        twitterUsername = coder.decodeObject(forKey: CodingKeys.twitterUsername.rawValue) as? String
        numOfRepositories = coder.decodeObject(forKey: CodingKeys.numOfRepositories.rawValue) as? Int
        numOfGists = coder.decodeObject(forKey: CodingKeys.numOfGists.rawValue) as? Int
        numOfFollowers = coder.decodeObject(forKey: CodingKeys.numOfFollowers.rawValue) as? Int
        numOfFollowing = coder.decodeObject(forKey: CodingKeys.numOfFollowing.rawValue) as? Int
        updatedAt = coder.decodeObject(forKey: CodingKeys.updatedAt.rawValue) as?  String
        createdAt = coder.decodeObject(forKey: CodingKeys.createdAt.rawValue) as?  String
    }
}
