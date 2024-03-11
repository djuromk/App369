//
//  OBR2.swift
//  App369
//
//  Created by DJUROM on 5/03/2024.
//

import SwiftUI

struct OBR2: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            Image("obr2")
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
                    
                    Circle()
                        .fill(Color("primary").opacity(0.5))
                        .frame(width: 8, height: 8)
                }
                
                Text("Vehicle expansions and services")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .semibold))
                    .frame(width: 280)
                    .multilineTextAlignment(.center)
                    .padding()
                    
                Spacer()
                
                NavigationLink(destination: {
                    
                    OBR3()
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
    OBR2()
}
