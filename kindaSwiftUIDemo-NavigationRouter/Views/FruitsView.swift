//
//  FruitsView.swift
//  kindaSwiftUIDemo-NavigationRouter
//
//  Created by Alex Nagy on 01.03.2023.
//

import SwiftUI
import kindaSwiftUI

struct FruitsView: View {
    
    let title: String
    
    var body: some View {
        Page<Destination, Group> { context in
            Group {
                List {
                    Section {
                        Button("Pop") {
                            context.router.pop()
                        }
                    } header: {
                        Text("Pop")
                    }
                }
                .navigationTitle(title)
            }
        }
    }
}

