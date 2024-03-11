//
//  VehicleViewModel.swift
//  App369
//
//  Created by DJUROM on 5/03/2024.
//

import SwiftUI
import CoreData

final class VehicleViewModel: ObservableObject {

    @Published var types: [String] = ["Fuel", "Service"]
    @Published var currentType = "Fuel"
    @Published var isAddCar: Bool = false
    
    @AppStorage("vehicle") var vehicle = ""
    @AppStorage("capacity") var capacity = ""
    @AppStorage("year") var year = ""
    
    @Published var vehicle1 = ""
    @Published var year1 = ""
    @Published var capacity1 = ""

    @Published var fuelType: String = ""
    @Published var fuelAmount: String = ""
    @Published var fuelDate: String = ""
    @Published var fuelTime: String = ""
    @Published var fuelCost: String = ""

    @Published var isAddFuel: Bool = false
    @Published var isDetailFuel: Bool = false
    @Published var isDelete: Bool = false


    @Published var fuels: [FuelModel] = []
    @Published var selectedFuel: FuelModel?
    
    func addFuel(completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "FuelModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let sub = NSEntityDescription.insertNewObject(forEntityName: "FuelModel", into: context) as! FuelModel
        
        sub.fuelType = fuelType
        sub.fuelAmount = fuelAmount
        sub.fuelDate = fuelDate
        sub.fuelTime = fuelTime
        sub.fuelCost = fuelCost

        CoreDataStack.shared.saveContext()
        
        completion()

    }
    
    func fetchFuels() {
        
        CoreDataStack.shared.modelName = "FuelModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<FuelModel>(entityName: "FuelModel")
        
        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.fuels = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.fuels = []
        }
    }
    
    @Published var vTitle: String = ""
    @Published var vDate: String = ""
    @Published var vCost: String = ""
    @Published var vNote: String = ""

    @Published var isAddVeh: Bool = false
    @Published var isDetailVeh: Bool = false
    @Published var isDeleteVeh: Bool = false
    @Published var isDeleteFuel: Bool = false

    @Published var vehicles: [VehicleModel] = []
    @Published var selectedVehicle: VehicleModel?
    
    func addVehicle(completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "VehicleModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let sub = NSEntityDescription.insertNewObject(forEntityName: "VehicleModel", into: context) as! VehicleModel
        
        sub.vTitle = vTitle
        sub.vDate = vDate
        sub.vCost = vCost
        sub.vNote = vNote

        CoreDataStack.shared.saveContext()
        
        completion()

    }
    
    func fetchVehicles() {
        
        CoreDataStack.shared.modelName = "VehicleModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<VehicleModel>(entityName: "VehicleModel")
        
        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.vehicles = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.vehicles = []
        }
    }

}

