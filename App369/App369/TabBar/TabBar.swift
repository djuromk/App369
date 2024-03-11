//
//  TabBar.swift
//  App369
//
//  Created by DJUROM on 5/03/2024.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {

        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index

                }, label: {
                    
                    VStack(alignment: .center, spacing: 8) {
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color("primary") : Color.gray)
                        
                        Text(index.rawValue)
                            .foregroundColor(selectedTab == index ? Color("primary") : Color.gray)
                            .font(.system(size: 11, weight: .regular))
                    }
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 14)
        .padding(.bottom, 26)
        .background(Color.black)
    }
}

enum Tab: String, CaseIterable {
    
    case Events = "Events"
    
    case Routes = "Routes"
    
    case Vehicle = "Vehicle"

    case Incidents = "Incidents"

    case Settings = "Settings"

    
}
