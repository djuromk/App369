//
//  IncidentsViewModel.swift
//  App369
//
//  Created by DJUROM on 5/03/2024.
//

import SwiftUI
import CoreData

final class IncidentsViewModel: ObservableObject {

    @Published var inTitle: String = ""
    @Published var inNotes: String = ""
    @Published var inDate: String = ""
    @Published var inTime: String = ""

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false


    @Published var incidents: [IncidentsModel] = []
    @Published var selectedIncident: IncidentsModel?
    
    func addIncident(completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "IncidentsModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let sub = NSEntityDescription.insertNewObject(forEntityName: "IncidentsModel", into: context) as! IncidentsModel
        
        sub.inTitle = inTitle
        sub.inNotes = inNotes
        sub.inDate = inDate
        sub.inTime = inTime

        CoreDataStack.shared.saveContext()
        
        completion()

    }
    
    func fetchIncidents() {
        
        CoreDataStack.shared.modelName = "IncidentsModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<IncidentsModel>(entityName: "IncidentsModel")
        
        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.incidents = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.incidents = []
        }
    }
}
