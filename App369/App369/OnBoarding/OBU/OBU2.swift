//
//  OBU2.swift
//  App369
//
//  Created by DJUROM on 5/03/2024.
//

import SwiftUI
import StoreKit

struct OBU2: View {
    var body: some View {
 
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            Image("obu2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.top, 80)
            
            VStack {
                
                HStack {
                    
                    Circle()
                        .fill(Color("primary").opacity(0.5))
                        .frame(width: 8, height: 8)
                    
                    Circle()
                        .fill(Color("primary"))
                        .frame(width: 8, height: 8)
   
                }
                
                Text("Rate us at App Store")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .semibold))
                    .padding()
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    OBU3()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 13).fill(Color("primary")))
                })
                .padding()
            }
        }
        .onAppear{
            
            SKStoreReviewController.requestReview()
        }
    }
}

#Preview {
    OBU2()
}
