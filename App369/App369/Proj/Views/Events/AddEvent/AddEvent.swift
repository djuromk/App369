//
//  AddEvent.swift
//  App369
//
//  Created by DJUROM on 5/03/2024.
//

import SwiftUI

struct AddEvent: View {
    
    @StateObject var viewModel: EventsViewModel
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
                            .foregroundColor(viewModel.evTitle.isEmpty ? .gray : . white)
                            .font(.system(size: 15, weight: .medium))
                            .opacity(viewModel.evTitle.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.evTitle)
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(viewModel.evTitle.isEmpty ? .gray : Color("primary"), lineWidth: 1.0))
                    .padding(1)
                    
                    HStack {
                        
                        Image(systemName: "calendar")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Date")
                            .foregroundColor(viewModel.evDate.isEmpty ? .gray : . white)
                            .font(.system(size: 15, weight: .medium))
                            .opacity(viewModel.evDate.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.evDate)
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                    })
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Time")
                                .foregroundColor(viewModel.evTime.isEmpty ? .gray : . white)
                                .font(.system(size: 15, weight: .medium))
                                .opacity(viewModel.evTime.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.evTime)
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                        })
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .background(RoundedRectangle(cornerRadius: 15).stroke(viewModel.evDate.isEmpty || viewModel.evTime.isEmpty ? .gray : Color("primary"), lineWidth: 1.0))
                .padding(1)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Notes")
                            .foregroundColor(viewModel.evNotes.isEmpty ? .gray : . white)
                            .font(.system(size: 15, weight: .medium))
                            .opacity(viewModel.evNotes.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.evNotes)
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(viewModel.evNotes.isEmpty ? .gray : Color("primary"), lineWidth: 1.0))
                    .padding(1)
                }
                
                Button(action: {
                    
                    viewModel.addGoal(completion: {
                        
                        viewModel.evTitle = ""
                        viewModel.evDate = ""
                        viewModel.evTime = ""
                        viewModel.evNotes = ""
                    })
                    
                    viewModel.fetchEvents()
                    
                    back.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 12).fill(Color("primary")))
                })
                .opacity(viewModel.evTitle.isEmpty || viewModel.evDate.isEmpty || viewModel.evTime.isEmpty || viewModel.evNotes.isEmpty ? 0.5 : 1)
                .disabled(viewModel.evTitle.isEmpty || viewModel.evDate.isEmpty || viewModel.evTime.isEmpty || viewModel.evNotes.isEmpty ? true : false)
            }
            .padding()
        }
    }
}

#Preview {
    AddEvent(viewModel: EventsViewModel())
}
