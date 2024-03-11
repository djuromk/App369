//
//  RoutesDetail.swift
//  App369
//
//  Created by DJUROM on 5/03/2024.
//

import SwiftUI

struct RoutesDetail: View {

    @StateObject var viewModel: RoutesViewModel
    @Environment(\.presentationMode) var back
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                                    
                    HStack {
                        
                        Button(action: {
                            
                            back.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Text("Back")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .regular))
                                
                            }
                        })
                        Spacer()
                    }
                .padding(.bottom, 20)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text(viewModel.selectedRoute?.rTitle ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 32, weight: .bold))
                        
                        HStack {
                            
                            Text(viewModel.selectedRoute?.rDeparture ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 22, weight: .semibold))
                            
                            Spacer()
                            
                            Image(systemName: "arrow.right")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                            
                            Spacer()
                            
                            Text(viewModel.selectedRoute?.rDestination ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 22, weight: .semibold))
                        }
                        
                        Text("Date")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                        
                        Text(viewModel.selectedRoute?.rDate ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .bold))
                        
                        Text("Time")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                        
                        Text(viewModel.selectedRoute?.rTime ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .bold))
                    }
                }
                
                Button(action: {
      
                    withAnimation(.spring()) {
                        
                        viewModel.isFinish = true
                    }
                    
                }, label: {
                    
                    Text("Finish")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 12).fill(Color("primary")))
                })
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isDelete = true
                    }
         
                }, label: {
                    
                    Text("Delete")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 12).fill(Color("red")))
                })
            }
            .padding()
        }
        .overlay (
        
            ZStack {
                
                Color.black.opacity(viewModel.isFinish ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        viewModel.isFinish = false
                    }
                
                VStack {
                    
                    DatePicker(selection: .constant(Date()), label: {})
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .accentColor(.blue)
                        .padding(9)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white.opacity(0.2)))

                    Button(action: {
          
                        withAnimation(.spring()) {
                            
                            viewModel.isFinish = false
                        }
                        
                    }, label: {
                        
                        Text("Finish")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 12).fill(Color("primary")))
                    })
                    .padding(9)

                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 25).fill(Color.black.opacity(0.5)))
                .padding()
                .offset(y: viewModel.isFinish ? 0 : UIScreen.main.bounds.height)
            }
        )
        .overlay (
        
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        viewModel.isDelete = false
                    }
                
                VStack {
                    
                    Text("Delete this route")
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
                        
                        CoreDataStack.shared.deleteRoute(withRouteTitle: viewModel.selectedRoute?.rTitle ?? "", completion: {
                            
                            viewModel.fetchRoutes()
                        })
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                            
                        }
                        
                        back.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .semibold))
                            .frame(maxWidth: .infinity)
                    })
                    .padding(9)
                    
                    Button(action: {

                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                            
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
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    RoutesDetail(viewModel: RoutesViewModel())
}
