//
//  CarrotView.swift
//  kindaSwiftUIDemo-NavigationRouter
//
//  Created by Alex Nagy on 22.02.2023.
//

import SwiftUI
import kindaSwiftUI

struct CarrotView: View {
    
    @EnvironmentObject private var router: Router<Destination>
    
    var body: some View {
        List {
            Section {
                Button("Push 🥝") {
                    router.push(.kiwiView)
                }
            } header: {
                Text("Push")
            }
            
#if os(iOS) || os(watchOS)
            Section {
                Button("Present 🍯 full screen cover") {
                    router.present(.honeyViewFullScreenCover)
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

