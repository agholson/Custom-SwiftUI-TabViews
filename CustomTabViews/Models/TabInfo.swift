//
//  TabInfo.swift
//  CustomTabViews
//
//  Created by Leone on 6/4/22.
//

import Foundation

/**
 Tab enum, which contains the differently defined tabs.
 */
enum Tab {
    case Home
    case Feed
    case Add
    case Account
    case Settings
}

/**
 Re-useable struct for each of the tabs.
 Making it Identifiable allows it to be used in multiple views differently, versus the same struct changing.
 - parameter view: Matches one of the Tab case statements e.g., Tab.Home, Tab.Feed
 - parameter icon: the name of the icon in the system images (SF Symbols app)
 - parameter name: name for a given tab e.g. home, profile, messages
 */
struct TabInfo: Identifiable {
    // Sets it to a random UUID to conform to the Identifiable protocol
    var id = UUID()
    // represents each view it goes to
    var view: Tab
    var icon: String
    var name: String
}
