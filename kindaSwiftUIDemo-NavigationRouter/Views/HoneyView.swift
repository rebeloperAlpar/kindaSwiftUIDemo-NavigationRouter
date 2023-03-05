//
//  HoneyView.swift
//  kindaSwiftUIDemo-NavigationRouter
//
//  Created by Alex Nagy on 22.02.2023.
//

import SwiftUI
import kindaSwiftUI

struct HoneyView: View {
    
    @EnvironmentObject private var router: Router<Destination>
    @EnvironmentObject private var modalDependencyLinker: ModalDependencyLinker
    
    var body: some View {
        List {
            Section {
                Button("Pop") {
                    router.pop()
                }
                
                Button("Pop the last 2") {
                    router.pop(.the(last: 2))
                }
                
                Button("Pop to root") {
                    router.pop(.toRoot)
                }
            } header: {
                Text("Pop")
            }
            
            Section {
                Button("Push 🍪") {
                    router.push(.cookieView)
                }
            } header: {
                Text("Push")
            }
            
            #if os(iOS) || os(macOS)
            Section {
                Button("Present 🍦 sheet") {
                    router.present(.iceCreamViewSheet)
                }
            } header: {
                Text("Present")
            }
            #endif
        }
        .navigationTitle("🍯")
        #if os(iOS) || os(macOS)
        .sheet(for: Destination.iceCreamViewSheet, presentationDetents: [.fraction(0.4)])
        .sheet(for: Destination.fruitsViewSheetFromHoneyView(dependency: modalDependencyLinker.fruitViewDependency))
        #endif
    }
}

