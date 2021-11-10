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
    
    static let shared = DataManager()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    private init () {}
    
    func addUsers(gitHubUsers: [GitHubUser]) {
        
        let managedContext = appDelegate.persistentContainer.viewContext
        var entity = NSEntityDescription.entity(forEntityName: "IndexEntity", in: managedContext)!
        let indexEntity = IndexEntity(entity: entity, insertInto: managedContext)
        indexEntity.setValue(1, forKey: "index")
        
        entity = NSEntityDescription.entity(forEntityName: "UsersEntity", in: managedContext)!
        let usersEntity = UsersEntity(entity: entity, insertInto: managedContext)
        usersEntity.setValue(gitHubUsers, forKey: "users")
        
        do {
           try managedContext.save()
         } catch let error as NSError {
             print("Could not save users. \(error)")
         }
    }
    
    func updateUsers(gitHubUsers: [GitHubUser], index: Int) {
        
        updateIndex(index: index)
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = UsersEntity.fetchRequest()
        
        do {
            let usersEntity = try managedContext.fetch(fetchRequest).first
            usersEntity?.users?.append(contentsOf: gitHubUsers)
            try managedContext.save()
         } catch let error as NSError {
             print("Could not fetch/update users. \(error)")
         }
    }
    
    func retrieveUsers() -> [GitHubUser] {
        
        var gitHubUsers: [GitHubUser] = []
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = UsersEntity.fetchRequest()

        do {
            let usersEntitiy = try managedContext.fetch(fetchRequest).first
            gitHubUsers = usersEntitiy?.users ?? []
        } catch let error as NSError {
          print("Could not fetch users. \(error)")
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
          print("Could not fetch index. \(error)")
        }
        return 0
    }
    
    func updateIndex(index: Int) {
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = IndexEntity.fetchRequest()
        
        do {
            let indexEntity = try managedContext.fetch(fetchRequest).first
            indexEntity?.setValue(index, forKey: "index")
            try managedContext.save()
        } catch let error as NSError {
          print("Could not fetch/update index. \(error)")
        }
    }
}
