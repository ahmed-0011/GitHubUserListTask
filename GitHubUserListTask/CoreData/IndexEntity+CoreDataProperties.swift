//
//  IndexEntity+CoreDataProperties.swift
//  GitHubUserListTask
//
//  Created by ahmed on 31/10/2021.
//
//

import Foundation
import CoreData


extension IndexEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<IndexEntity> {
        return NSFetchRequest<IndexEntity>(entityName: "IndexEntity")
    }

    @NSManaged public var index: Int16

}

extension IndexEntity : Identifiable {

}
