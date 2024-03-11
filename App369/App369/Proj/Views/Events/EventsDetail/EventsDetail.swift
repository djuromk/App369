//
//  EventsDetail.swift
//  App369
//
//  Created by DJUROM on 5/03/2024.
//

import SwiftUI

struct EventsDetail: View {

    @StateObject var viewModel: EventsViewModel
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
                        
                        Text(viewModel.selectedEvent?.evTitle ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 32, weight: .bold))
                        
                        HStack {
                            
                            Text("Date")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                            Spacer()
                            
                            Text("Time")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .padding(.trailing, 40)
                        }
                        
                        HStack {
                            
                            Text(viewModel.selectedEvent?.evDate ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 22, weight: .semibold))
                            
                            Spacer()
                            
                            Text(viewModel.selectedEvent?.evTime ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 22, weight: .semibold))
                        }
                        
                        Text(viewModel.selectedEvent?.evNotes ?? "")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                    }
                }
                
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
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        viewModel.isDelete = false
                    }
                
                VStack {
                    
                    Text("Delete this event")
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
                        
                        CoreDataStack.shared.deleteEvent(withEventsTitle: viewModel.selectedEvent?.evTitle ?? "", completion: {
                            
                            viewModel.fetchEvents()
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
    EventsDetail(viewModel: EventsViewModel())
}
