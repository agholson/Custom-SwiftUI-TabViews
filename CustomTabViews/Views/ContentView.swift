//
//  ContentView.swift
//  CustomTabViews
//
//  Created by Leone on 6/4/22.
//

import SwiftUI

struct ContentView: View {
    
    // Initialize as an empty TabInfo array
    @State var tabs = [TabInfo]()
    
    // Keeps track of the currently selected tab, default to home
    @State var selectedTab = Tab.Home
    
    var body: some View {
        
        // Use a GeometryReader in order to take the entire space
        GeometryReader { geo in
            
            VStack {
                // MARK: Switch tab Content
                switch(selectedTab) {
                    
                case Tab.Home:
                    // Show home
                    Text("Home")
                    
                case Tab.Feed:
                    // Show feed
                    Text("Feed")
                    
                case Tab.Add:
                    // Show add form
                    Text("Add")
                    
                case Tab.Account:
                    // Show account
                    Text("Account")
                    
                case Tab.Settings:
                    // Show settings
                    Text("Settings")
                }
                
                Spacer()
                
                // MARK: Custom Tab Bar
                VStack {
                    
                    Path({ path in
                        
                        // Tell it to go to the center of the frame
                        path.move(to: CGPoint(x: 0, y: 0))
                        
                        // Create the line using the entire width with the geo at the same height
                        path.addLine(to: CGPoint(x: geo.size.width, y: 0))
                        
                    })
                        .stroke(.gray)
                    
                    // MARK: Custom Tab View
                    HStack(spacing: 0) { // Set spacing to zero to manage our own space
                        
                        // Use Spacer here and underneath to center all elements in between
                        Spacer()
                        
                        // Loop through the custom tabs
                        ForEach(tabs) { tab in
                            
                            CuostomTabBarButton(selectedTab: $selectedTab, tab: tab)
                            // Place the width for the button here, because no button should know the size of any other buttons
                                .frame(width: (geo.size.width - 40)/5)
                            
                        }
                        .ignoresSafeArea(edges: .bottom)
                        
                        // Second spacer pushes everything to the left
                        Spacer()
                        
                    }
                    
                }
                .frame(height: 70) // Makes entire frame of the VStack 70, so the tab bar comes down on top of the search icons
                
            }
            // MARK: Create Tabs
            .onAppear {
                var newTabs = [TabInfo]()
                
                // Add new TabInfo element to array with proper settings
                newTabs.append(TabInfo(view: Tab.Home, icon: "person", name: "Home"))
                newTabs.append(TabInfo(view: Tab.Feed, icon: "envelope", name: "Feed"))
                newTabs.append(TabInfo(view: Tab.Add, icon: "plus", name: "Add"))
                newTabs.append(TabInfo(view: Tab.Account, icon: "star.fill", name: "Account"))
                newTabs.append(TabInfo(view: Tab.Settings, icon: "gear", name: "Settings"))
                
                // Set the tabs state property equal to this temp array
                self.tabs = newTabs 
                
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
