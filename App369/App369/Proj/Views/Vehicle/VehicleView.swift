//
//  VehicleView.swift
//  App369
//
//  Created by DJUROM on 5/03/2024.
//

import SwiftUI

struct VehicleView: View {
    
    @StateObject var viewModel = VehicleViewModel()
    
    var body: some View {

        ZStack {
            
            Color("primary")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Vehicle")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .semibold))
                    .padding()
                
                VStack {
                    
                    if viewModel.capacity.isEmpty || viewModel.year.isEmpty || viewModel.vehicle.isEmpty {
                        
                        VStack(spacing: 15) {
                            
                            HStack {
                                
                                Text("Add vehicle")
                                    .foregroundColor(.white)
                                    .font(.system(size: 28, weight: .bold))
                                
                                Spacer()
                                
                                Button(action: {
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isAddCar = true
                                    }
                                    
                                }, label: {
                                    
                                    Image(systemName: "plus")
                                        .foregroundColor(.white)
                                        .font(.system(size: 24, weight: .medium))
                                })
                            }
                            
                            Text("To add a vehicle click a plus icon above")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .medium))
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        
                    } else {
                        
                        VStack(spacing: 15) {
                            
                            HStack {
                                
                                Text("\(viewModel.vehicle)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 28, weight: .bold))
                                
                                Spacer()
                                
                                Button(action: {
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isAddCar = true
                                    }
                                    
                                }, label: {
                                    
                                    Image(systemName: "pencil")
                                        .foregroundColor(.white)
                                        .font(.system(size: 24, weight: .medium))
                                })
                            }
                            
                            HStack {
                                
                                Text("\(viewModel.capacity) places")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .medium))
                                
                                Spacer()
                                
                                Text("\(viewModel.year)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .medium))
                            }
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                    }
                    
                    HStack {
                    
                        ForEach(viewModel.types, id: \.self) {index in
                            
                            Button(action: {
                                
                                viewModel.currentType = index
                                
                            }, label: {
                                
                                Text(index)
                                    .foregroundColor(.white.opacity(viewModel.currentType == index ? 1 : 0.5))
                                    .font(.system(size: 16, weight: .regular))
                                    .padding(8)
                                    .padding(.horizontal)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(viewModel.currentType == index ? Color("primary") : Color.black.opacity(0.5)))
                            })
                        }
                        
                        Spacer()
                    }
                    .padding(.vertical, 7)
                    
                    if viewModel.currentType == "Fuel" {
                        
                        if viewModel.fuels.isEmpty {
                            
                            VStack(spacing: 12) {
                                
                                Text("Empty")
                                    .foregroundColor(.white)
                                    .font(.system(size: 32, weight: .semibold))
                                
                                Text("To add a fuel spendings click a button below")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .regular))
                            }
                            .frame(maxHeight: .infinity)
                            
                        } else {
                            
                            ScrollView(.vertical, showsIndicators: false) {
                                
                                LazyVStack {
                                    
                                    ForEach(viewModel.fuels, id: \.self) { index in
                                        
                                        Button(action: {
                                            
                                            viewModel.selectedFuel = index
                                            withAnimation(.spring()) {
                                                
                                                viewModel.isDeleteFuel = true
                                            }
                                            
                                        }, label: {
                                            
                                            HStack {
                                             
                                                VStack(alignment: .leading, spacing: 12) {
                                                    
                                                    Text("\(index.fuelType ?? ""), \(index.fuelAmount ?? "")LT")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 22, weight: .bold))
                                                    
                                                    Text(index.fuelDate ?? "")
                                                        .foregroundColor(.gray)
                                                        .font(.system(size: 16, weight: .regular))
                                                }
                                                
                                                Spacer()
                                                
                                                Text("\(index.fuelCost ?? "") $")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 32, weight: .bold))
                                            }
                                            .padding()
                                            .background(RoundedRectangle(cornerRadius: 15).fill(.black.opacity(0.5)))
                                        })
                                    }
                                }
                            }
                        }
                        
                    } else {
                        
                        if viewModel.vehicles.isEmpty {
                            
                            VStack(spacing: 12) {
                                
                                Text("Empty")
                                    .foregroundColor(.white)
                                    .font(.system(size: 32, weight: .semibold))
                                
                                Text("click a button below")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .regular))
                            }
                            .frame(maxHeight: .infinity)
                            
                        } else {
                            
                            ScrollView(.vertical, showsIndicators: false) {
                                
                                LazyVStack {
                                    
                                    ForEach(viewModel.vehicles, id: \.self) { index in
                                        
                                        Button(action: {
                                            
                                            viewModel.selectedVehicle = index
                                            
                                            withAnimation(.spring()) {
                                                
                                                viewModel.isDeleteVeh = true
                                            }
                                            
                                        }, label: {
                                            
                                            VStack {
                                                
                                                HStack {
                                                    
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                        Text(index.vTitle ?? "")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 22, weight: .bold))
                                                        
                                                        Text(index.vDate ?? "")
                                                            .foregroundColor(.gray)
                                                            .font(.system(size: 16, weight: .regular))
                                                    }
                                                    
                                                    Spacer()
                                                    
                                                    Text("$ \(index.vCost ?? "")")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 32, weight: .bold))
                                                }
                                                
                                                Rectangle()
                                                    .fill(Color("primary"))
                                                    .frame(maxWidth: .infinity)
                                                    .frame(height: 1)
                                                    .padding(.vertical, 8)
                                                
                                                Text(index.vNote ?? "")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 16, weight: .regular))
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                    .multilineTextAlignment(.leading)
                                            }
                                            .padding()
                                            .background(RoundedRectangle(cornerRadius: 15).fill(.black.opacity(0.5)))
                                        })
                                    }
                                }
                            }
                        }
                    }
                    
                    if viewModel.currentType == "Fuel" {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddFuel = true
                            }
                            
                        }, label: {
                            
                            Text("Add fuel")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 12).fill(Color("primary")))
                        })
                        .padding(.bottom)
                        
                    } else {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddVeh = true
                            }
                            
                        }, label: {
                            
                            Text("Add service")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 12).fill(Color("primary")))
                        })
                        .padding(.bottom)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(maxHeight: .infinity)
                .background(Color("bg"))
                .ignoresSafeArea()
                
            }
        }
        .onAppear {
            
            viewModel.fetchFuels()
        }
        .onAppear {
            
            viewModel.fetchVehicles()
        }
        .overlay (
        
            ZStack {
                
                Color.black.opacity(viewModel.isAddCar ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        viewModel.isAddCar = false
                    }
                
                VStack {
                    
                    Text("Your car")
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .semibold))
                        .padding(2)
                        .padding(.top)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Vehicle")
                            .foregroundColor(viewModel.vehicle1.isEmpty ? .gray : . white)
                            .font(.system(size: 15, weight: .medium))
                            .opacity(viewModel.vehicle1.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.vehicle1)
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(viewModel.vehicle1.isEmpty ? .gray : Color("primary"), lineWidth: 1.0))
                    .padding(1)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Year")
                            .foregroundColor(viewModel.year1.isEmpty ? .gray : . white)
                            .font(.system(size: 15, weight: .medium))
                            .opacity(viewModel.year1.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.year1)
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(viewModel.year1.isEmpty ? .gray : Color("primary"), lineWidth: 1.0))
                    .padding(1)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Capacity")
                            .foregroundColor(viewModel.capacity1.isEmpty ? .gray : . white)
                            .font(.system(size: 15, weight: .medium))
                            .opacity(viewModel.capacity1.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.capacity1)
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(viewModel.capacity1.isEmpty ? .gray : Color("primary"), lineWidth: 1.0))
                    .padding(1)
                    
                    Button(action: {
                        
                        viewModel.vehicle = viewModel.vehicle1
                        viewModel.year = viewModel.year1
                        viewModel.capacity = viewModel.capacity1
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddCar = false

                        }
                        
                    }, label: {
                        
                        Text("Add")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .semibold))
                            .frame(maxWidth: .infinity)
                    })
                    .padding(9)
                    
                    Button(action: {
                        
                        viewModel.isAddCar = false
                        
                    }, label: {
                        
                        Text("Cancel")
                            .foregroundColor(.red)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                    })
                    .padding(9)

                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 25).fill(Color.black.opacity(0.5)))
                .padding()
                .offset(y: viewModel.isAddCar ? 0 : UIScreen.main.bounds.height)
            }
        )
        .sheet(isPresented: $viewModel.isAddVeh, content: {
            
            AddVehicle(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isAddFuel, content: {
            
            AddFuel(viewModel: viewModel)
        })
        .overlay (
        
            ZStack {
                
                Color.black.opacity(viewModel.isDeleteFuel ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        viewModel.isDeleteFuel = false
                    }
                
                VStack {
                    
                    Text("Delete")
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .semibold))
                        .padding(2)
                        .padding(.top)
                    
                    Text("Are you sure you want to delete?")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                        .padding(2)
                        .padding(.top)

                    Button(action: {
                        
                        CoreDataStack.shared.deleteFuel(withFuelType: viewModel.selectedFuel?.fuelType ?? "", completion: {
                            
                            viewModel.fetchFuels()
                        })
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDeleteFuel = false
                            
                        }
                                                
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .semibold))
                            .frame(maxWidth: .infinity)
                    })
                    .padding(9)
                    
                    Button(action: {

                        withAnimation(.spring()) {
                            
                            viewModel.isDeleteFuel = false
                            
                        }
                                                
                    }, label: {
                        
                        Text("Cancel")
                            .foregroundColor(.red)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                    })
                    .padding(9)

                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 25).fill(Color.black.opacity(0.5)))
                .padding()
                .offset(y: viewModel.isDeleteFuel ? 0 : UIScreen.main.bounds.height)
            }
        )
        .overlay (
        
            ZStack {
                
                Color.black.opacity(viewModel.isDeleteVeh ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        viewModel.isDeleteVeh = false
                    }
                
                VStack {
                    
                    Text("Delete")
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .semibold))
                        .padding(2)
                        .padding(.top)
                    
                    Text("Are you sure you want to delete?")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                        .padding(2)
                        .padding(.top)

                    Button(action: {
                        
                        CoreDataStack.shared.deleteVehicle(withVehicleTytle: viewModel.selectedVehicle?.vTitle ?? "", completion: {
                            
                            viewModel.fetchVehicles()
                        })
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDeleteVeh = false
                            
                        }
                                                
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .semibold))
                            .frame(maxWidth: .infinity)
                    })
                    .padding(9)
                    
                    Button(action: {

                        withAnimation(.spring()) {
                            
                            viewModel.isDeleteVeh = false
                            
                        }
                                                
                    }, label: {
                        
                        Text("Cancel")
                            .foregroundColor(.red)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                    })
                    .padding(9)

                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 25).fill(Color.black.opacity(0.5)))
                .padding()
                .offset(y: viewModel.isDeleteVeh ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    VehicleView()
}
