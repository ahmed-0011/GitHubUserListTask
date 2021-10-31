//
//  UserEntity+CoreDataProperties.swift
//  GitHubUserListTask
//
//  Created by ahmed on 31/10/2021.
//
//

import Foundation
import CoreData


extension UserEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserEntity> {
        return NSFetchRequest<UserEntity>(entityName: "UserEntity")
    }

    @NSManaged public var user: GitHubUser?

}

extension UserEntity : Identifiable {

}
