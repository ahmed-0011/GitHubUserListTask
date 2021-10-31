//
//  GitHubUser.swift
//  GithubUserListTask
//
//  Created by ahmed on 26/10/2021.
//

import Foundation
import UIKit

public class GitHubUser: NSObject, NSSecureCoding, Decodable {
    
    public static var supportsSecureCoding: Bool {
        return true
    }
    var info: GitHubUserInfo?
    var image: UIImage?
    let username: String?
    let imageURL: String?
    let url: String?
    let link: String?

    enum CodingKeys: String, CodingKey {
      case username = "login"
      case imageURL = "avatar_url"
      case url = "url"
      case link = "html_url"
      case info = "info"
      // case image = "image"   (can't use CodingKeys for it)
    }

    
    // MARK: - Encoding for CoreData
    public func encode(with coder: NSCoder) {
        coder.encode(info, forKey: CodingKeys.info.rawValue)
        coder.encode(image, forKey: "image")
        coder.encode(username, forKey: CodingKeys.username.rawValue)
        coder.encode(link, forKey: CodingKeys.link.rawValue)
        coder.encode(imageURL, forKey: CodingKeys.imageURL.rawValue)
        coder.encode(url, forKey: CodingKeys.url.rawValue)
    }
    
    public required init?(coder: NSCoder) {
        info = coder.decodeObject(forKey: CodingKeys.info.rawValue) as? GitHubUserInfo
        image = coder.decodeObject(forKey:"image") as? UIImage
        username = coder.decodeObject(forKey: CodingKeys.username.rawValue) as? String
        link = coder.decodeObject(forKey: CodingKeys.link.rawValue) as? String
        imageURL = coder.decodeObject(forKey: CodingKeys.imageURL.rawValue) as? String
        url = coder.decodeObject(forKey: CodingKeys.url.rawValue) as? String
    }
}
