//
//  RoutesViewModel.swift
//  App369
//
//  Created by DJUROM on 5/03/2024.
//

import SwiftUI
import CoreData

final class RoutesViewModel: ObservableObject {

    @Published var rTitle: String = ""
    @Published var rDeparture: String = ""
    @Published var rDestination: String = ""
    @Published var rDate: String = ""
    @Published var rTime: String = ""

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isFinish: Bool = false
    @Published var isDelete: Bool = false

    @Published var routes: [RoutesModel] = []
    @Published var selectedRoute: RoutesModel?
    
    func addRoute(completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "RoutesModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let sub = NSEntityDescription.insertNewObject(forEntityName: "RoutesModel", into: context) as! RoutesModel
        
        sub.rTitle = rTitle
        sub.rDeparture = rDeparture
        sub.rDestination = rDestination
        sub.rDate = rDate
        sub.rTime = rTime

        CoreDataStack.shared.saveContext()
        
        completion()

    }
    
    func fetchRoutes() {
        
        CoreDataStack.shared.modelName = "RoutesModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<RoutesModel>(entityName: "RoutesModel")
        
        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.routes = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.routes = []
        }
    }
}
