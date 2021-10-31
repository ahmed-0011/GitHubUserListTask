//
//  UserTransformer.swift
//  GitHubUserListTask
//
//  Created by ahmed on 31/10/2021.
//

import Foundation
import  UIKit

@objc(UserTransformer)
class UserTransformer: NSSecureUnarchiveFromDataTransformer {
    override class var allowedTopLevelClasses: [AnyClass] {
        return super.allowedTopLevelClasses + [GitHubUser.self, GitHubUserInfo.self, UIImage.self]
    }
}
