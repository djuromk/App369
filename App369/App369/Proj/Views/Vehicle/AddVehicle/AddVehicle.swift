//
//  AddVehicle.swift
//  App369
//
//  Created by DJUROM on 5/03/2024.
//

import SwiftUI

struct AddVehicle: View {
    
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
                        
                        Text("Title")
                            .foregroundColor(viewModel.vTitle.isEmpty ? .gray : . white)
                            .font(.system(size: 15, weight: .medium))
                            .opacity(viewModel.vTitle.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.vTitle)
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(viewModel.vTitle.isEmpty ? .gray : Color("primary"), lineWidth: 1.0))
                    .padding(1)
                    
                    HStack {
                        
                        Image(systemName: "calendar")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Date")
                            .foregroundColor(viewModel.vDate.isEmpty ? .gray : . white)
                            .font(.system(size: 15, weight: .medium))
                            .opacity(viewModel.vDate.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.vDate)
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                    })
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .background(RoundedRectangle(cornerRadius: 15).stroke(viewModel.vDate.isEmpty ? .gray : Color("primary"), lineWidth: 1.0))
                .padding(1)

                    ZStack(alignment: .leading, content: {
                        
                        Text("Cost")
                            .foregroundColor(viewModel.vCost.isEmpty ? .gray : . white)
                            .font(.system(size: 15, weight: .medium))
                            .opacity(viewModel.vCost.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.vCost)
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(viewModel.vCost.isEmpty ? .gray : Color("primary"), lineWidth: 1.0))
                    .padding(1)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Note")
                            .foregroundColor(viewModel.vNote.isEmpty ? .gray : . white)
                            .font(.system(size: 15, weight: .medium))
                            .opacity(viewModel.vNote.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.vNote)
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(viewModel.vNote.isEmpty ? .gray : Color("primary"), lineWidth: 1.0))
                    .padding(1)

                }
                
                Button(action: {
                    
                    viewModel.addVehicle(completion: {
                        
                        viewModel.vTitle = ""
                        viewModel.vDate = ""
                        viewModel.vNote = ""
                        viewModel.vCost = ""

                    })
                    
                    viewModel.fetchVehicles()
                    
                    back.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 12).fill(Color("primary")))
                })
                .opacity(viewModel.vTitle.isEmpty || viewModel.vDate.isEmpty || viewModel.vCost.isEmpty || viewModel.vNote.isEmpty ? 0.5 : 1)
                .disabled(viewModel.vTitle.isEmpty || viewModel.vDate.isEmpty || viewModel.vCost.isEmpty || viewModel.vNote.isEmpty ? true : false)
            }
            .padding()
        }
    }
}

#Preview {
    AddVehicle(viewModel: VehicleViewModel())
}
