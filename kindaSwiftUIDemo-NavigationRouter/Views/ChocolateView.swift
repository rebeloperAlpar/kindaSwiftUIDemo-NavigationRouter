//
//  ChocolateView.swift
//  kindaSwiftUIDemo-NavigationRouter
//
//  Created by Alex Nagy on 22.02.2023.
//

import SwiftUI
import kindaSwiftUI

struct ChocolateView: View {
    
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
                        
                        Button("Pop to index 1") {
                            context.router.pop(.to(index: 1))
                        }
                        
                        Button("Pop to root") {
                            context.router.pop(.toRoot)
                        }
                    } header: {
                        Text("Pop")
                    }

                    Section {
                        Button("Push 🍓") {
                            context.router.push(.fruitsViewSheet(dependency: "🍓"))
                        }
                        
                        Button("Push 🍒") {
                            context.router.push(.fruitsViewSheet(dependency: "🍒"))
                        }
                    } header: {
                        Text("Push with dependency")
                    }
                    
                    #if os(iOS) || os(macOS)
                    Section {
                        Button("Present 🍓 sheet") {
                            context.router.present(.fruitsViewSheet(dependency: "🍓"), dependencyLink: $modalDependencyLinker.fruitViewDependency)
                        }
                        
                        Button("Present 🍒 sheet") {
                            context.router.present(.fruitsViewSheet(dependency: "🍒"), dependencyLink: $modalDependencyLinker.fruitViewDependency)
                        }
                    } header: {
                        Text("Present with dependency")
                    }

                    Section {
                        Button("Present 🍯 sheet") {
                            context.router.present(.honeyViewSheet)
                        }
                    } header: {
                        Text("Present")
                    }
                    #endif
                    
                }
                .navigationTitle("🍫")
                #if os(iOS) || os(macOS)
                .sheet(for: Destination.fruitsViewSheet(dependency: modalDependencyLinker.fruitViewDependency))
                .sheet(for: Destination.honeyViewSheet, options: .init(detents: [.medium, .large], cornerRadius: 50, contentInteraction: .scrolls)) {
                    log(.debug, type: .developer, "🍯 sheet dismissed")
                }
                #endif
            }
        }
    }
}

