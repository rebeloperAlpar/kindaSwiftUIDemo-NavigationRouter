//
//  CarrotView.swift
//  kindaSwiftUIDemo-NavigationRouter
//
//  Created by Alex Nagy on 22.02.2023.
//

import SwiftUI
import kindaSwiftUI

struct CarrotView: View {
    
    var body: some View {
        Page<Destination, Group> { context in
            Group {
                List {
                    Section {
                        Button("Push 🥝") {
                            context.router.push(.kiwiView)
                        }
                    } header: {
                        Text("Push")
                    }
                    
        #if os(iOS) || os(watchOS)
                    Section {
                        Button("Present 🍯 full screen cover") {
                            context.router.present(.honeyViewFullScreenCover)
                        }
                    } header: {
                        Text("Present")
                    }
        #endif
                }
                .navigationTitle("🥕")
        #if os(iOS) || os(watchOS)
                .fullScreenCover(for: Destination.honeyViewFullScreenCover)
        #endif
            }
        }
    }
}

