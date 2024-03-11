//
//  AddRoute.swift
//  App369
//
//  Created by DJUROM on 5/03/2024.
//

import SwiftUI

struct AddRoute: View {
    
    @StateObject var viewModel: RoutesViewModel
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
                        
                        Text("Title")
                            .foregroundColor(viewModel.rTitle.isEmpty ? .gray : . white)
                            .font(.system(size: 15, weight: .medium))
                            .opacity(viewModel.rTitle.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.rTitle)
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(viewModel.rTitle.isEmpty ? .gray : Color("primary"), lineWidth: 1.0))
                    .padding(1)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Departure")
                            .foregroundColor(viewModel.rDeparture.isEmpty ? .gray : . white)
                            .font(.system(size: 15, weight: .medium))
                            .opacity(viewModel.rDeparture.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.rDeparture)
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(viewModel.rDeparture.isEmpty ? .gray : Color("primary"), lineWidth: 1.0))
                    .padding(1)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Destination")
                            .foregroundColor(viewModel.rDestination.isEmpty ? .gray : . white)
                            .font(.system(size: 15, weight: .medium))
                            .opacity(viewModel.rDestination.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.rDestination)
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(viewModel.rDestination.isEmpty ? .gray : Color("primary"), lineWidth: 1.0))
                    .padding(1)
                    
                    HStack {
                        
                        Image(systemName: "calendar")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Date")
                            .foregroundColor(viewModel.rDate.isEmpty ? .gray : . white)
                            .font(.system(size: 15, weight: .medium))
                            .opacity(viewModel.rDate.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.rDate)
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                    })
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Time")
                                .foregroundColor(viewModel.rTime.isEmpty ? .gray : . white)
                                .font(.system(size: 15, weight: .medium))
                                .opacity(viewModel.rTime.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.rTime)
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                        })
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .background(RoundedRectangle(cornerRadius: 15).stroke(viewModel.rDate.isEmpty || viewModel.rTime.isEmpty ? .gray : Color("primary"), lineWidth: 1.0))
                .padding(1)
                }
                
                Button(action: {
                    
                    viewModel.addRoute(completion: {
                        
                        viewModel.rTitle = ""
                        viewModel.rDeparture = ""
                        viewModel.rDestination = ""
                        viewModel.rDate = ""
                        viewModel.rTime = ""

                    })
                    
                    viewModel.fetchRoutes()
                    
                    back.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 12).fill(Color("primary")))
                })
                .opacity(viewModel.rTitle.isEmpty || viewModel.rDeparture.isEmpty || viewModel.rDestination.isEmpty || viewModel.rDate.isEmpty || viewModel.rTime.isEmpty ? 0.5 : 1)
                .disabled(viewModel.rTitle.isEmpty || viewModel.rDeparture.isEmpty || viewModel.rDestination.isEmpty || viewModel.rDate.isEmpty || viewModel.rTime.isEmpty ? true : false)
            }
            .padding()
        }
    }
}

#Preview {
    AddRoute(viewModel: RoutesViewModel())
}
