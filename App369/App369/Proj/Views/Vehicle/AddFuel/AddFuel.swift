//
//  AddFuel.swift
//  App369
//
//  Created by DJUROM on 5/03/2024.
//

import SwiftUI

struct AddFuel: View {

    @StateObject var viewModel: VehicleViewModel
    @Environment(\.presentationMode) var back

    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    HStack {
                        
                        Button(action: {
                            
                            back.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(Color("red"))
                                .font(.system(size: 16, weight: .regular))
                        })
                        Spacer()
                    }
                    
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                }
                .padding(.bottom, 20)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Type of fuel")
                            .foregroundColor(viewModel.fuelType.isEmpty ? .gray : . white)
                            .font(.system(size: 15, weight: .medium))
                            .opacity(viewModel.fuelType.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.fuelType)
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(viewModel.fuelType.isEmpty ? .gray : Color("primary"), lineWidth: 1.0))
                    .padding(1)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Amount of fuel, Lt")
                            .foregroundColor(viewModel.fuelAmount.isEmpty ? .gray : . white)
                            .font(.system(size: 15, weight: .medium))
                            .opacity(viewModel.fuelAmount.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.fuelAmount)
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(viewModel.fuelAmount.isEmpty ? .gray : Color("primary"), lineWidth: 1.0))
                    .padding(1)

                    HStack {
                        
                        Image(systemName: "calendar")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Date")
                            .foregroundColor(viewModel.fuelDate.isEmpty ? .gray : . white)
                            .font(.system(size: 15, weight: .medium))
                            .opacity(viewModel.fuelDate.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.fuelDate)
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                    })
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Time")
                                .foregroundColor(viewModel.fuelTime.isEmpty ? .gray : . white)
                                .font(.system(size: 15, weight: .medium))
                                .opacity(viewModel.fuelTime.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.fuelTime)
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                        })
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .background(RoundedRectangle(cornerRadius: 15).stroke(viewModel.fuelDate.isEmpty || viewModel.fuelTime.isEmpty ? .gray : Color("primary"), lineWidth: 1.0))
                .padding(1)
                    
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Cost")
                            .foregroundColor(viewModel.fuelCost.isEmpty ? .gray : . white)
                            .font(.system(size: 15, weight: .medium))
                            .opacity(viewModel.fuelCost.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.fuelCost)
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(viewModel.fuelCost.isEmpty ? .gray : Color("primary"), lineWidth: 1.0))
                    .padding(1)
                    
                }
                
                Button(action: {
                    
                    viewModel.addFuel(completion: {
                        
                        viewModel.fuelType = ""
                        viewModel.fuelAmount = ""
                        viewModel.fuelDate = ""
                        viewModel.fuelTime = ""
                        viewModel.fuelCost = ""

                    })
                    
                    viewModel.fetchFuels()
                    
                    back.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 12).fill(Color("primary")))
                })
                .opacity(viewModel.fuelType.isEmpty || viewModel.fuelAmount.isEmpty || viewModel.fuelDate.isEmpty || viewModel.fuelTime.isEmpty || viewModel.fuelCost.isEmpty ? 0.5 : 1)
                .disabled(viewModel.fuelType.isEmpty || viewModel.fuelAmount.isEmpty || viewModel.fuelDate.isEmpty || viewModel.fuelTime.isEmpty || viewModel.fuelCost.isEmpty ? true : false)
            }
            .padding()
        }
    }
}

#Preview {
    AddFuel(viewModel: VehicleViewModel())
}
