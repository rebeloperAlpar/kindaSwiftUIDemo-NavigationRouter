//
//  CakeView.swift
//  kindaSwiftUIDemo-NavigationRouter
//
//  Created by Alex Nagy on 22.02.2023.
//

import SwiftUI
import kindaSwiftUI

struct CakeView: View {
    
    @EnvironmentObject private var modalDependencyLinker: ModalDependencyLinker
    
    @State private var didPresentDeepLink = false
    
    var body: some View {
        Page<Destination, Group> { context in
            Group {
                List {
                    Section {
                        Button("Push 🍩") {
                            context.router.push(.doughnutView)
                        }
                    } header: {
                        Text("Push")
                    }
                }
                .navigationTitle("🎂")
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                        deepLink(context)
                    })
                }
            }
        }
    }
    
    func deepLink(_ context: PageContext<Destination>) {
        guard !didPresentDeepLink else { return }
        log(.debug, type: .developer, "Presenting deep link")
        Task {
            await context.router.push(.doughnutView)
            await context.router.push(.junkFoodView(dependency: "🍕"))
            await context.router.push(.chocolateView)
            #if os(iOS) || os(macOS)
            await context.router.present(.honeyViewSheet)
            await context.router.present(.fruitsViewSheetFromHoneyView(dependency: "🍉"), dependencyLink: $modalDependencyLinker.fruitViewDependency)
            #elseif os(watchOS)
            await context.router.present(.honeyViewFullScreenCover)
            await context.router.present(.fruitsViewFullScreenCoverFromHoneyView(dependency: "🍉"), dependencyLink: $modalDependencyLinker.fruitViewDependency)
            #elseif os(tvOS)
            await context.router.push(.honeyViewSheet)
            await context.router.push(.fruitsViewSheetFromHoneyView(dependency: "🍉"))
            #endif
            didPresentDeepLink.toggle()
        }
    }
}
