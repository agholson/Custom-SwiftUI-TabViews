//
//  CuostomTabBarButton.swift
//  CustomTabViews
//
//  Created by Leone on 6/11/22.
//

import SwiftUI

/**
 Creates the button displayed for the tab. It will make the tab appear with a blue border/ active, when selected.
*/
struct CuostomTabBarButton: View {
    
    @Binding var selectedTab: Tab
    var tab: TabInfo
    
    var body: some View {
        
        VStack(spacing: 5) { // Adds space between the elements inside
            // MARK: Blue Selected box
            Rectangle()
                .foregroundColor(.blue)
                .frame(height: 1)
                .opacity(selectedTab == tab.view ? 1 : 0)
                .padding(.bottom, 10)
            
            // Creates an image based on the array above
            Image(systemName: tab.icon)
                .frame(height: 30)
            Text(tab.name)
                .font(.caption)
        }
        // Change color based on selected tab
        .foregroundColor(tab.view == selectedTab ? .blue : .gray)
        // If it is the selected tab, then add a shadow
        .shadow(radius: tab.view == selectedTab ? 2 : 0)
        .padding(.vertical)
        // Create a frame around each one, minus 40, because of 20 padding on each side, then divided by five, because of five elements
        .frame(height: 60) // Keeps this from using all the space, so custom tab bar shows
        // MARK: Set Active Tab
        // Makes the element tappable
        .onTapGesture {
            // Set the selected tab to the view property
            self.selectedTab = tab.view
        }
    }
}
//
//struct CuostomTabBarButton_Previews: PreviewProvider {
//    
//    let tab = TabInfo(view: Tab.Add, icon: "plus", name: "Add")
//    static var previews: some View {
//        CuostomTabBarButton(selectedTab: Binding.constant("Home"), tab: tab)
//    }
//}
