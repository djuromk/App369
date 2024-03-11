//
//  IncidentsView.swift
//  App369
//
//  Created by DJUROM on 5/03/2024.
//

import SwiftUI

struct IncidentsView: View {

    @StateObject var viewModel = IncidentsViewModel()
    
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
                    
                    if viewModel.incidents.isEmpty {
                        
                        VStack(spacing: 12) {
                            
                            Text("No incidents")
                                .foregroundColor(.white)
                                .font(.system(size: 32, weight: .bold))
                            
                            Text("To add a trip click a button below")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .regular))
                        }
                        .frame(maxHeight: .infinity)
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            LazyVStack {
                                
                                ForEach(viewModel.incidents, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.selectedIncident = index
                                        
                                        withAnimation(.spring()) {
                                            
                                            viewModel.isDetail = true
                                        }
                                        
                                    }, label: {
                                        
                                        VStack(alignment: .leading, spacing: 10) {
                                            
                                            Text(index.inDate ?? "")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 16, weight: .regular))
                                
                                            Text(index.inTitle ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 24, weight: .bold))
                                            
                                            Rectangle()
                                                .fill(Color("primary"))
                                                .frame(maxWidth: .infinity)
                                                .frame(height: 1)
                                            
                                            Text(index.inNotes ?? "")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 16, weight: .regular))
                                                .multilineTextAlignment(.leading)
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(RoundedRectangle(cornerRadius: 20).fill(.black.opacity(0.5)))
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
                        
                        Text("Add new incident")
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
            
            viewModel.fetchIncidents()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddIncident(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            IncidentDetail(viewModel: viewModel)
        })
    }
}
#Preview {
    IncidentsView()
}
