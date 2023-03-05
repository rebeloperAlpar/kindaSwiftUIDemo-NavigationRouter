//
//  kindaSwiftUIDemo_NavigationRouterApp.swift
//  kindaSwiftUIDemo-NavigationRouter
//
//  Created by Alex Nagy on 22.02.2023.
//

import SwiftUI
import kindaSwiftUI

@main
struct kindaSwiftUIDemo_NavigationRouterApp: App {
    var body: some Scene {
        WindowGroup {
            KindaSwiftUIContentView(logLevel: .debug) {
                ContentView()
            }
        }
    }
}
