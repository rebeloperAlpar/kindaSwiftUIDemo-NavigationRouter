//
//  ChocolateView.swift
//  kindaSwiftUIDemo-NavigationRouter
//
//  Created by Alex Nagy on 22.02.2023.
//

import SwiftUI
import kindaSwiftUI

struct ChocolateView: View {
    
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
                
                Button("Pop to index 1") {
                    router.pop(.to(index: 1))
                }
                
                Button("Pop to root") {
                    router.pop(.toRoot)
                }
            } header: {
                Text("Pop")
            }

            Section {
                Button("Push 🍓") {
                    router.push(.fruitsViewSheet(dependency: "🍓"))
                }
                
                Button("Push 🍒") {
                    router.push(.fruitsViewSheet(dependency: "🍒"))
                }
            } header: {
                Text("Push with dependency")
            }
            
            #if os(iOS) || os(macOS)
            Section {
                Button("Present 🍓 sheet") {
                    router.present(.fruitsViewSheet(dependency: "🍓"), dependencyLink: $modalDependencyLinker.fruitViewDependency)
                }
                
                Button("Present 🍒 sheet") {
                    router.present(.fruitsViewSheet(dependency: "🍒"), dependencyLink: $modalDependencyLinker.fruitViewDependency)
                }
            } header: {
                Text("Present with dependency")
            }

            Section {
                Button("Present 🍯 sheet") {
                    router.present(.honeyViewSheet)
                }
            } header: {
                Text("Present")
            }
            #endif
            
        }
        .navigationTitle("🍫")
        #if os(iOS) || os(macOS)
        .sheet(for: Destination.fruitsViewSheet(dependency: modalDependencyLinker.fruitViewDependency))
        .sheet(for: Destination.honeyViewSheet, presentationDetents: [.medium, .large], presentationDragIndicatorVisibility: .visible) {
            log(.debug, type: .developer, "🍯 sheet dismissed")
        }
        #endif
    }
}

