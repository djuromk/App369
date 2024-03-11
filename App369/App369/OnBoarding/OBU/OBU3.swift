//
//  OBU3.swift
//  App369
//
//  Created by DJUROM on 5/03/2024.
//

import SwiftUI
import OneSignalFramework

struct OBU3: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            Image("obu3")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.top, 80)
            
            VStack {
                
                HStack {
                    
                    Circle()
                        .fill(Color("primary"))
                        .frame(width: 8, height: 8)
                    
                    Circle()
                        .fill(Color("primary").opacity(0.5))
                        .frame(width: 8, height: 8)
                }
                
                Text("Don’t miss anything")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .semibold))
                    .padding()
                
                Spacer()
                
                Button(action: {
                    
                    OneSignal.Notifications.requestPermission({ accepted in
                      print("User accepted notifications: \(accepted)")
                        status = true
                    }, fallbackToSettings: true)
                    
                }, label: {
                    
                    Text("Enable Notifications")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 13).fill(Color("primary")))
                })
                .padding()
            }
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        
                        status = true
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .bold))
                            .padding()
                    })
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    OBU3()
}
