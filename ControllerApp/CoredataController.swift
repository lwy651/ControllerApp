//
//  CoredataController.swift
//  ControllerApp
//
//  Created by 651 on 2018/3/31.
//  Copyright © 2018年 651. All rights reserved.
//

import UIKit
import CoreData
class CoredataController: NSObject {
    static let instance:CoredataController = CoredataController()
    class func getInstance()->CoredataController {
        return instance
    }
    
    var app:AppDelegate
    var context:NSManagedObjectContext
    
    override init() {
        app = UIApplication.shared.delegate as! AppDelegate
        context = app.persistentContainer.viewContext
    }
    
    func saveData() {
        //let app = UIApplication.shared.delegate as! AppDelegate
        //let context = app.persistentContainer.viewContext
        
        let EntityName = "User"
        let oneUser = NSEntityDescription.insertNewObject(forEntityName: EntityName, into: context) as! User
        
        oneUser.username = "kongzhi"
        oneUser.password = "123456"
        
        app.saveContext()
    }
    func queryData() {
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest()
        //fetchRequest.fetchLimit = 1 //限制查询结果的数量
        fetchRequest.fetchOffset = 0  //查询的偏移量
        
        let EntityName = "User"
        let entity:NSEntityDescription? = NSEntityDescription.entity(forEntityName: EntityName, in: context)
        fetchRequest.entity = entity
        
        do {
            let fetchedObjects = try context.fetch(fetchRequest) as! [User]
            print(fetchedObjects.count)
        } catch  {
            let nserror = error as NSError
            fatalError("查询错误： \(nserror), \(nserror.userInfo)")
        }
    }
    func checkUser(name:String,password:String) -> Bool {
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest()
        fetchRequest.fetchLimit = 1
        fetchRequest.fetchOffset = 0  //查询的偏移量
        
        let EntityName = "User"
        let entity:NSEntityDescription? = NSEntityDescription.entity(forEntityName: EntityName, in: context)
        fetchRequest.entity = entity
        
        let predicate = NSPredicate(format: "username='\(name)'", "")
        fetchRequest.predicate = predicate
        
        do {
            let fetchedObjects = try context.fetch(fetchRequest) as! [User]
            for person in fetchedObjects{
                if(person.password==password)
                {
                    return true
                }
            }
        } catch  {
            let nserror = error as NSError
            fatalError("查询错误： \(nserror), \(nserror.userInfo)")
        }
        
        return false
    }
}
