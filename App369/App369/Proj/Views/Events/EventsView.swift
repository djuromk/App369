//
//  EventsView.swift
//  App369
//
//  Created by DJUROM on 5/03/2024.
//

import SwiftUI

struct EventsView: View {
    
    @StateObject var viewModel = EventsViewModel()
    
    var body: some View {

        ZStack {
            
            Color("primary")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Events")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .semibold))
                    .padding()
                
                VStack {
                    
                    if viewModel.events.isEmpty {
                        
                        VStack(spacing: 12) {
                            
                            Text(" No events")
                                .foregroundColor(.white)
                                .font(.system(size: 32, weight: .bold))
                            
                            Text("Add events to manage your routes")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .regular))
                        }
                        .frame(maxHeight: .infinity)
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            LazyVStack {
                                
                                ForEach(viewModel.events, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.selectedEvent = index
                                        withAnimation(.spring()) {
                                            
                                            viewModel.isDetail = true
                                        }
                                        
                                    }, label: {
                                        
                                        VStack(alignment: .leading, spacing: 10) {
                                            
                                            Text(index.evTitle ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 28, weight: .semibold))
                                            
                                            Text(index.evNotes ?? "")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 16, weight: .regular))
                                            
                                            Rectangle()
                                                .fill(Color("primary"))
                                                .frame(maxWidth: .infinity)
                                                .frame(height: 1)
                                            
                                            HStack {
                                                
                                                Text(index.evDate ?? "")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 18, weight: .regular))
                                                
                                                Spacer()
                                                
                                                Text(index.evDate ?? "")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 18, weight: .regular))
                                            }
                                        }
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 15).fill(.black.opacity(0.5)))
                                    })
                                }
                            }
                        }
                    }
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                        Text("Add new event")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 12).fill(Color("primary")))
                    })
                    .padding(.bottom)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(maxHeight: .infinity)
                .background(Color("bg"))
                .ignoresSafeArea()
            }
        }
        .onAppear {
            
            viewModel.fetchEvents()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddEvent(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            EventsDetail(viewModel: viewModel)
        })
    }
}

#Preview {
    EventsView()
}
