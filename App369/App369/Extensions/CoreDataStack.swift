//
//  CoreDataStack.swift
//  App369
//
//  Created by DJUROM on 5/03/2024.
//

import SwiftUI
import CoreData

class CoreDataStack {

    static let shared = CoreDataStack()
    
    private init() {}
    
    var modelName: String = "" {
        
        didSet {
            
            persistentContainer = NSPersistentContainer(name: modelName)
            persistentContainer.loadPersistentStores(completionHandler: { (storeDescription, error) in
            
                if let error = error as NSError? {
                    
                    fatalError("Unresolved error \(error), \(error.userInfo)")
                }
            })
        }
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: modelName)
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
        
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext() {
        
        let context = persistentContainer.viewContext
        
        if context.hasChanges {
            
            do {
                
                try context.save()
                
            } catch {
                
                let nserror = error as NSError
                
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func deleteAllData() {
        
        let context = persistentContainer.viewContext
        let entities = persistentContainer.managedObjectModel.entities
        
        for entity in entities {
            
            if let entityName = entity.name {
                
                let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entityName)
                
                do {
                    
                    let objects = try context.fetch(fetchRequest) as? [NSManagedObject]
                    objects?.forEach { context.delete($0) }
                    
                    try context.save()
                    
                } catch let error {
                    
                    print("Error deleting \(entityName): \(error)")
                }
            }
        }
    }
    
    func deleteRoute(withRouteTitle name: String, completion: @escaping () -> Void) {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<RoutesModel> = RoutesModel.fetchRequest()

        fetchRequest.predicate = NSPredicate(format: "rTitle == %@", name)

        do {

            let objects = try context.fetch(fetchRequest)

            for object in objects {

                context.delete(object)
            }

            CoreDataStack.shared.saveContext()

            completion()
        } catch {

            print("Error fetching: \(error)")
        }
    }
    
    func deleteEvent(withEventsTitle name: String, completion: @escaping () -> Void) {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<EventsModel> = EventsModel.fetchRequest()

        fetchRequest.predicate = NSPredicate(format: "evTitle == %@", name)

        do {

            let objects = try context.fetch(fetchRequest)

            for object in objects {

                context.delete(object)
            }

            CoreDataStack.shared.saveContext()

            completion()
        } catch {

            print("Error fetching: \(error)")
        }
    }
    
    func deleteFuel(withFuelType name: String, completion: @escaping () -> Void) {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<FuelModel> = FuelModel.fetchRequest()

        fetchRequest.predicate = NSPredicate(format: "fuelType == %@", name)

        do {

            let objects = try context.fetch(fetchRequest)

            for object in objects {

                context.delete(object)
            }

            CoreDataStack.shared.saveContext()

            completion()
        } catch {

            print("Error fetching: \(error)")
        }
    }
    
    func deleteVehicle(withVehicleTytle name: String, completion: @escaping () -> Void) {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<VehicleModel> = VehicleModel.fetchRequest()

        fetchRequest.predicate = NSPredicate(format: "vTitle == %@", name)

        do {

            let objects = try context.fetch(fetchRequest)

            for object in objects {

                context.delete(object)
            }

            CoreDataStack.shared.saveContext()

            completion()
        } catch {

            print("Error fetching: \(error)")
        }
    }
    
    func deleteIncident(withIncidentTitle name: String, completion: @escaping () -> Void) {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<IncidentsModel> = IncidentsModel.fetchRequest()

        fetchRequest.predicate = NSPredicate(format: "inTitle == %@", name)

        do {

            let objects = try context.fetch(fetchRequest)

            for object in objects {

                context.delete(object)
            }

            CoreDataStack.shared.saveContext()

            completion()
        } catch {

            print("Error fetching: \(error)")
        }
    }

}
