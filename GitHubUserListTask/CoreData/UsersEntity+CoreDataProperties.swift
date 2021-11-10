//
//  UsersEntity+CoreDataProperties.swift
//  
//
//  Created by ahmed on 10/11/2021.
//
//

import Foundation
import CoreData


extension UsersEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UsersEntity> {
        return NSFetchRequest<UsersEntity>(entityName: "UsersEntity")
    }

    @NSManaged public var users: [GitHubUser]?

}
