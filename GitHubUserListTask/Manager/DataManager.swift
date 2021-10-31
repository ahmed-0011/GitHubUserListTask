//
//  DataManager.swift
//  GithubUserListTask
//
//  Created by ahmed on 28/10/2021.
//

import Foundation
import UIKit
import CoreData

class DataManager {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
     
    func saveUsers(gitHubUsers: [GitHubUser], index: Int) {
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        if index == 0 {
            let entity = NSEntityDescription.entity(forEntityName: "IndexEntity", in: managedContext)!
            let indexEntity = IndexEntity(entity: entity, insertInto: managedContext)
            indexEntity.setValue(index, forKey: "index")
        } else {
            updateIndex(index: index)
        }
        
        for gitHubUser in gitHubUsers {
            let entity = NSEntityDescription.entity(forEntityName: "UserEntity", in: managedContext)!
            let userEntity = UserEntity(entity: entity, insertInto: managedContext)
            userEntity.setValue(gitHubUser, forKey: "user")
        }
    
        do {
           try managedContext.save()
         } catch let error as NSError {
             print("Could not save. \(error)")
         }
    }
    
    func retrieveUsers() -> [GitHubUser] {
        
        var gitHubUsers: [GitHubUser] = []
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = UserEntity.fetchRequest()

        do {
            let usersEntities = try managedContext.fetch(fetchRequest)
            for userEntity in usersEntities {
                gitHubUsers.append(userEntity.user!)
            }
        } catch let error as NSError {
          print("Could not fetch. \(error)")
        }
        return gitHubUsers
    }
    
    func getIndex() -> Int {
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = IndexEntity.fetchRequest()
        
        do {
            let indexEntity = try managedContext.fetch(fetchRequest).first
            return Int(indexEntity?.index ?? 0)
        } catch let error as NSError {
          print("Could not fetch. \(error)")
        }
        return 0
    }
    
    func updateIndex(index: Int) {
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<IndexEntity>(entityName: "IndexEntity")
        
        do {
            let indexEntity = try managedContext.fetch(fetchRequest).first
            indexEntity?.setValue(index, forKey: "index")
            try managedContext.save()
        } catch let error as NSError {
          print("Could not fetch/update. \(error)")
        }
    }
}
