//
//  NavigationRouterSetup.swift
//  kindaSwiftUIDemo-NavigationRouter
//
//  Created by Alex Nagy on 22.02.2023.
//

import SwiftUI
import kindaSwiftUI

// MARK: - Destination

public enum Destination: RouterDestination {
    case defaultView
    
    case carrotView
    case kiwiView
    
    case cakeView
    case doughnutView
    case junkFoodView(dependency: String)
    case chocolateView
    case cookieView
    case popcornView
    case honeyViewSheet
#if os(iOS) || os(watchOS)
    case honeyViewFullScreenCover
#endif
    case iceCreamViewSheet
    case fruitsViewSheet(dependency: String)
    case fruitsViewSheetFromHoneyView(dependency: String)
#if os(iOS) || os(watchOS)
    case fruitsViewFullScreenCoverFromHoneyView(dependency: String)
#endif
    
    public var modalValue: ModalValue {
        switch self {
        case .defaultView: return ModalValue(index: -1)
            
        case .carrotView: return ModalValue(index: 0)
        case .kiwiView: return ModalValue(index: 1)
            
        case .cakeView: return ModalValue(index: 2)
        case .doughnutView: return ModalValue(index: 3)
        case .junkFoodView(let dependency): return ModalValue(index: 4, dependency: dependency)
        case .chocolateView: return ModalValue(index: 5)
        case .cookieView: return ModalValue(index: 6)
        case .popcornView: return ModalValue(index: 7)
        case .honeyViewSheet: return ModalValue(index: 8)
#if os(iOS) || os(watchOS)
        case .honeyViewFullScreenCover: return ModalValue(index: 9)
#endif
        case .iceCreamViewSheet: return ModalValue(index: 10)
        case .fruitsViewSheet(let dependency): return ModalValue(index: 11, dependency: dependency)
        case .fruitsViewSheetFromHoneyView(let dependency): return ModalValue(index: 12, dependency: dependency)
#if os(iOS) || os(watchOS)
        case .fruitsViewFullScreenCoverFromHoneyView(let dependency): return ModalValue(index: 13, dependency: dependency)
#endif
            
        }
    }
    
    public init?(modalValue: ModalValue) {
        switch modalValue.index {
        case 0: self = .carrotView
        case 1: self = .kiwiView
            
        case 2: self = .cakeView
        case 3: self = .doughnutView
        case 4: self = .junkFoodView(dependency: modalValue.dependency as? String ?? "")
        case 5: self = .chocolateView
        case 6: self = .cookieView
        case 7: self = .popcornView
        case 8: self = .honeyViewSheet
#if os(iOS) || os(watchOS)
        case 9: self = .honeyViewFullScreenCover
#endif
        case 10: self = .iceCreamViewSheet
        case 11: self = .fruitsViewSheet(dependency: modalValue.dependency as? String ?? "")
        case 12: self = .fruitsViewSheetFromHoneyView(dependency: modalValue.dependency as? String ?? "")
#if os(iOS) || os(watchOS)
        case 13: self = .fruitsViewFullScreenCoverFromHoneyView(dependency: modalValue.dependency as? String ?? "")
#endif
            
        default:
            self = .defaultView
        }
    }
    
    public var body: some View {
        switch self {
        case .defaultView:
            EmptyView()
            
        case .carrotView:
            CarrotView()
        case .kiwiView:
            KiwiView()
            
        case .cakeView:
            CakeView()
        case .doughnutView:
            DoughnutView()
        case .junkFoodView(let dependency):
            JunkFoodView(title: dependency)
        case .chocolateView:
            ChocolateView()
        case .cookieView:
            CookieView()
        case .popcornView:
            PopcornView()
        case .honeyViewSheet:
            HoneyView()
#if os(iOS) || os(watchOS)
        case .honeyViewFullScreenCover:
            HoneyView()
        case .iceCreamViewSheet:
            IceCreamView()
        case .fruitsViewSheet(let dependency):
            FruitsView(title: dependency)
        case .fruitsViewSheetFromHoneyView(let dependency):
            FruitsView(title: dependency)
        case .fruitsViewFullScreenCoverFromHoneyView(let dependency):
            FruitsView(title: dependency)
#endif
        }
    }
}

// MARK: - Tab

#if os(iOS) || os(watchOS)
public enum Tab: RouterTab {
    
    case item(systemImage: String, title: String)
    
    public var body: some View {
        switch self {
        case .item(let systemImage, let title):
            tabItem(systemImage: systemImage, title: title)
        }
    }
    
    @ViewBuilder
    func tabItem(systemImage: String, title: String) -> some View {
        Image(systemName: systemImage)
            .imageScale(.large)
#if !os(watchOS)
        Text(title).bold()
#endif
    }
}

// MARK: - CustomTab

public enum CustomTab: RouterTab {
    
    case item(systemImage: String, title: String)
    
    public var body: some View {
        switch self {
        case .item(let systemImage, let title):
            tabItem(systemImage: systemImage, title: title)
        }
    }
    
    @ViewBuilder
    func tabItem(systemImage: String, title: String) -> some View {
        HStack {
            Image(systemName: systemImage)
                .imageScale(.large)
#if !os(watchOS)
            Text(title).bold()
#endif
        }
        .foregroundColor(.white)
        .padding(6)
        .background(content: {
            Color.orange
                .cornerRadius(8)
        })
        .padding(6)
    }
}

// MARK: - CustomUnselectedTab

public enum CustomUnselectedTab: RouterUnselectedTab {
    
    case item(systemImage: String, title: String)
    
    public var body: some View {
        switch self {
        case .item(let systemImage, let title):
            tabItem(systemImage: systemImage, title: title)
        }
    }
    
    @ViewBuilder
    func tabItem(systemImage: String, title: String) -> some View {
        HStack {
            Image(systemName: systemImage)
                .imageScale(.large)
#if !os(watchOS)
            Text(title)
#endif
        }
        .foregroundColor(.gray)
        .padding(12)
    }
}
#endif

class ModalDependencyLinker: RouterModalDependencyLinker {
    @Published var fruitViewDependency = ""
}

