//
//  FruitsView.swift
//  kindaSwiftUIDemo-NavigationRouter
//
//  Created by Alex Nagy on 01.03.2023.
//

import SwiftUI
import kindaSwiftUI

struct FruitsView: View {
    
    @EnvironmentObject private var router: Router<Destination>
    
    let title: String
    
    var body: some View {
        List {
            Section {
                Button("Pop") {
                    router.pop()
                }
            } header: {
                Text("Pop")
            }
        }
        .navigationTitle(title)
    }
}

