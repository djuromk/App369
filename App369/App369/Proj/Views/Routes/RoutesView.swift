//
//  RoutesView.swift
//  App369
//
//  Created by DJUROM on 5/03/2024.
//

import SwiftUI

struct RoutesView: View {

    @StateObject var viewModel = RoutesViewModel()
    
    var body: some View {

        ZStack {
            
            Color("primary")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Routes")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .semibold))
                    .padding()
                
                VStack {
                    
                    if viewModel.routes.isEmpty {
                        
                        VStack(spacing: 12) {
                            
                            Text(" No routes")
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
                                
                                ForEach(viewModel.routes, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.selectedRoute = index
                                        
                                        withAnimation(.spring()) {
                                            
                                            viewModel.isDetail = true
                                        }
                                        
                                    }, label: {
                                        
                                        VStack(alignment: .leading, spacing: 10) {
                                            
                                            Text(index.rTitle ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 28, weight: .bold))
                                            
                                            HStack {
                                                
                                                Text(index.rDeparture ?? "")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 18, weight: .regular))
                                                
                                                Spacer()
                                                
                                                Image(systemName: "arrow.right")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 18, weight: .regular))
                                                
                                                Spacer()
                                                
                                                Text(index.rDestination ?? "")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 18, weight: .regular))
                                            }
                                            
                                            Rectangle()
                                                .fill(Color("primary"))
                                                .frame(maxWidth: .infinity)
                                                .frame(height: 1)
                                                .padding(.vertical, 6)
                                            
                                            HStack {
                                                
                                                VStack(alignment: .leading, spacing: 8) {
                                                    
                                                    Text(index.rDate ?? "")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 18, weight: .regular))
                                                    
                                                    
                                                    Text(index.rTime ?? "")
                                                        .foregroundColor(.gray)
                                                        .font(.system(size: 14, weight: .regular))
                                                    
                                                }
                                                
                                                Spacer()
                                    
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
                        
                        Text("Add new route")
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
            
            viewModel.fetchRoutes()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddRoute(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            RoutesDetail(viewModel: viewModel)
        })
    }
}

#Preview {
    RoutesView()
}
