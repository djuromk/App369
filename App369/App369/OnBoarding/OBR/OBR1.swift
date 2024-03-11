//
//  OBR1.swift
//  App369
//
//  Created by DJUROM on 5/03/2024.
//

import SwiftUI

struct OBR1: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            Image("obr1")
                .resizable()
                .padding(.top, 80)
            
            VStack {
                
                HStack {
                    
                    Circle()
                        .fill(Color("primary"))
                        .frame(width: 8, height: 8)
                    
                    Circle()
                        .fill(Color("primary").opacity(0.5))
                        .frame(width: 8, height: 8)
                    
                    Circle()
                        .fill(Color("primary").opacity(0.5))
                        .frame(width: 8, height: 8)
                }
                
                Text("Manage routes to keep comfort")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .semibold))
                    .frame(width: 280)
                    .multilineTextAlignment(.center)
                    .padding()
                    
                Spacer()
                
                NavigationLink(destination: {
                    
                    OBR2()
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
    }
}

#Preview {
    OBR1()
}
