//
//  SettingsView.swift
//  App369
//
//  Created by DJUROM on 5/03/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    var body: some View {

        ZStack {
            
            Color("primary")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Settings")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .semibold))
                    .padding()
                
                VStack {
           
                    Button(action: {
                        
                        guard let url = URL(string: DataManager().usagePolicy) else { return }

                        UIApplication.shared.open(url)
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "doc.fill")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 18, weight: .regular))
                            
                            Text("Usage profile")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .regular))
                            
                            Spacer()
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(.black.opacity(0.5)))
                    })
                    
                    Button(action: {
                        
                        SKStoreReviewController.requestReview()
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 18, weight: .regular))
                            
                            Text("Rate app")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .regular))
                            
                            Spacer()
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(.black.opacity(0.5)))
                    })
                    
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(maxHeight: .infinity)
                .background(Color("bg"))
                .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    SettingsView()
}
