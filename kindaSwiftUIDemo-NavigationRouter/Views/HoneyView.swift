//
//  HoneyView.swift
//  kindaSwiftUIDemo-NavigationRouter
//
//  Created by Alex Nagy on 22.02.2023.
//

import SwiftUI
import kindaSwiftUI

struct HoneyView: View {
    
    @EnvironmentObject private var modalDependencyLinker: ModalDependencyLinker
    
    var body: some View {
        Page<Destination, Group> { context in
            Group {
                List {
                    Section {
                        Button("Pop") {
                            context.router.pop()
                        }
                        
                        Button("Pop the last 2") {
                            context.router.pop(.the(last: 2))
                        }
                        
                        Button("Pop to root") {
                            context.router.pop(.toRoot)
                        }
                    } header: {
                        Text("Pop")
                    }
                    
                    Section {
                        Button("Push 🍪") {
                            context.router.push(.cookieView)
                        }
                    } header: {
                        Text("Push")
                    }
                    
                    #if os(iOS) || os(macOS)
                    Section {
                        Button("Present 🍦 sheet") {
                            context.router.present(.iceCreamViewSheet)
                        }
                    } header: {
                        Text("Present")
                    }
                    #endif
                }
                .navigationTitle("🍯")
                #if os(iOS) || os(macOS)
                .sheet(for: Destination.iceCreamViewSheet, options: .init(detents: [.fraction(0.4)]))
                .sheet(for: Destination.fruitsViewSheetFromHoneyView(dependency: modalDependencyLinker.fruitViewDependency))
                #endif
            }
        }
    }
}

