//
//  DataStore.swift
//  Jet2Travel
//
//  Created by Rakesh Patole on 12/07/20.
//

import Foundation
import CoreData

class DataStore {
    var persistentContainer: NSPersistentContainer
    
    static let shared = DataStore()
    private init() {
        let container = NSPersistentContainer(name: "Jet2Travel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        container.viewContext.undoManager = nil
        container.viewContext.shouldDeleteInaccessibleFaults = true
        
        self.persistentContainer = container
    }
    
    public var viewContext : NSManagedObjectContext {
        return self.persistentContainer.viewContext
    }
    
    public func newTaskContext() -> NSManagedObjectContext {
        let taskContext = persistentContainer.newBackgroundContext()
        taskContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        taskContext.undoManager = nil
        return taskContext
    }
    
    func saveContext (_ context: NSManagedObjectContext ) {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
