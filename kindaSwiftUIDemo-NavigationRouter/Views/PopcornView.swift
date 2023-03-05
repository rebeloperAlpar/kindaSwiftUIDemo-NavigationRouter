//
//  PopcornView.swift
//  kindaSwiftUIDemo-NavigationRouter
//
//  Created by Alex Nagy on 22.02.2023.
//

import SwiftUI
import kindaSwiftUI

struct PopcornView: View {
    
    @EnvironmentObject private var router: Router<Destination>
    
    var body: some View {
        List {
            Section {
                Button("Pop") {
                    router.pop()
                }
            }

            Section {
                Button("Pop to nearest root") {
                    router.pop(.toNearestRoot)
                }
            } header: {
                Text("Pop to nearest root")
            }

            Section {
                Button("Pop the last 2 (one by one)") {
                    router.pop(.theLastWith(style: .oneByOne, last: 2))
                }
                
                Button("Pop the last 5 (one by one)") {
                    router.pop(.theLastWith(style: .oneByOne, last: 5))
                }
                
                Button("Pop to index 1 (one by one)") {
                    router.pop(.toIndexWith(style: .oneByOne, index: 1))
                }
                
                Button("Pop to root (one by one)") {
                    router.pop(.toRootWith(style: .oneByOne))
                }
                
                Button("Pop to nearest root (one by one)") {
                    router.pop(.toNearestRootWith(style: .oneByOne))
                }
            } header: {
                Text("Pop one by one")
            }
            
        }
        .navigationTitle("🍿")
    }
}

