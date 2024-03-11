//
//  AddIncident.swift
//  App369
//
//  Created by DJUROM on 5/03/2024.
//

import SwiftUI

struct AddIncident: View {

    @StateObject var viewModel: IncidentsViewModel
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
                            .foregroundColor(viewModel.inTitle.isEmpty ? .gray : . white)
                            .font(.system(size: 15, weight: .medium))
                            .opacity(viewModel.inTitle.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.inTitle)
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(viewModel.inTitle.isEmpty ? .gray : Color("primary"), lineWidth: 1.0))
                    .padding(1)
                    
                    HStack {
                        
                        Image(systemName: "calendar")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Date")
                            .foregroundColor(viewModel.inDate.isEmpty ? .gray : . white)
                            .font(.system(size: 15, weight: .medium))
                            .opacity(viewModel.inDate.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.inDate)
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                    })
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Time")
                                .foregroundColor(viewModel.inTime.isEmpty ? .gray : . white)
                                .font(.system(size: 15, weight: .medium))
                                .opacity(viewModel.inTime.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.inTime)
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                        })
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .background(RoundedRectangle(cornerRadius: 15).stroke(viewModel.inDate.isEmpty || viewModel.inTime.isEmpty ? .gray : Color("primary"), lineWidth: 1.0))
                .padding(1)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Notes")
                            .foregroundColor(viewModel.inNotes.isEmpty ? .gray : . white)
                            .font(.system(size: 15, weight: .medium))
                            .opacity(viewModel.inNotes.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.inNotes)
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(viewModel.inNotes.isEmpty ? .gray : Color("primary"), lineWidth: 1.0))
                    .padding(1)

                }
                
                Button(action: {
                    
                    viewModel.addIncident(completion: {
                        
                        viewModel.inTitle = ""
                        viewModel.inNotes = ""
                        viewModel.inDate = ""
                        viewModel.inTime = ""

                    })
                    
                    viewModel.fetchIncidents()
                    
                    back.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 12).fill(Color("primary")))
                })
                .opacity(viewModel.inTitle.isEmpty || viewModel.inNotes.isEmpty || viewModel.inDate.isEmpty || viewModel.inTime.isEmpty ? 0.5 : 1)
                .disabled(viewModel.inTitle.isEmpty || viewModel.inNotes.isEmpty || viewModel.inDate.isEmpty || viewModel.inTime.isEmpty ? true : false)
            }
            .padding()
        }
    }
}

#Preview {
    AddIncident(viewModel: IncidentsViewModel())
}
