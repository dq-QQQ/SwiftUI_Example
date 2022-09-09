//
//  coreDataStack.swift
//  ho
//
//  Created by Kyu jin Lee on 2022/09/10.
//

import CoreData

class CoreDataStack: ObservableObject {
    private let persistentContainer: NSPersistentContainer
    var managedObjectContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    init(modelName: String) {
        persistentContainer = {
            let container = NSPersistentContainer(name: modelName)
            container.loadPersistentStores { description, error in
                if let err = error {
                    print(err)
                }
            }
            return container
        }()
    }
    
    func save() {
        guard managedObjectContext.hasChanges else {
            return
        }
        do {
            try managedObjectContext.save()
        } catch {
            print(error)
        }
    }
    
    func insertContact(firstName: String, lastName: String, phoneNumber: String) {
        let contact = Contact(context: managedObjectContext)
        contact.firstName = firstName
        contact.lastName = lastName
        contact.phoneNumber = phoneNumber
    }
}


func addContacts(to coreDataStack: CoreDataStack) {
    guard UserDefaults.standard.bool(forKey: "alreadyRun") == false else {
        return
    }
    UserDefaults.standard.set(true, forKey: "alreadyRun")

    [("Lee", lastName: "kyujin", "000000000"),
     ("kim", lastName: "kyujin", "111111111"),
     ("park", lastName: "gyujin", "222222222")]
        .forEach { (firstName, lastName, phoneNumber) in
            coreDataStack.insertContact(firstName: firstName, lastName: lastName, phoneNumber: phoneNumber)
    }
}
