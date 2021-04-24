//
//  MasteryGradingApp.swift
//  MasteryGrading
//
//  Created by Gerard Gomez on 4/24/21.
//

import SwiftUI

@main
struct MasteryGradingApp: App {
    
    @StateObject var dataController: DataController
    
    init() {
        let dataController = DataController()
        _dataController = StateObject(wrappedValue: dataController)
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(dataController)
        }
    }
}
