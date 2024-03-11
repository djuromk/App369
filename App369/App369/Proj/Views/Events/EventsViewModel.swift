//
//  EventsViewModel.swift
//  App369
//
//  Created by DJUROM on 5/03/2024.
//

import SwiftUI
import CoreData

final class EventsViewModel: ObservableObject {

    @Published var evTitle: String = ""
    @Published var evDate: String = ""
    @Published var evTime: String = ""
    @Published var evNotes: String = ""

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false


    @Published var events: [EventsModel] = []
    @Published var selectedEvent: EventsModel?
    
    func addGoal(completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "EventsModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let sub = NSEntityDescription.insertNewObject(forEntityName: "EventsModel", into: context) as! EventsModel
        
        sub.evTitle = evTitle
        sub.evTime = evTime
        sub.evDate = evDate
        sub.evNotes = evNotes

        CoreDataStack.shared.saveContext()
        
        completion()

    }
    
    func fetchEvents() {
        
        CoreDataStack.shared.modelName = "EventsModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<EventsModel>(entityName: "EventsModel")
        
        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.events = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.events = []
        }
    }
}
