//
//  IndexEntity+CoreDataProperties.swift
//  
//
//  Created by ahmed on 10/11/2021.
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
