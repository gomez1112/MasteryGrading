//
//  ContentView.swift
//  MasteryGrading
//
//  Created by Gerard Gomez on 4/24/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            OutcomeView(showFinishedOutcomes: false)
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Unfinished")
                }
            OutcomeView(showFinishedOutcomes: true)
                .tabItem {
                    Image(systemName: "checkmark")
                    Text("Finished")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var dataController = DataController.preview
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, dataController.container.viewContext)
            .environmentObject(dataController)
    }
}
