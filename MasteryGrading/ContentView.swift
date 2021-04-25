//
//  ContentView.swift
//  MasteryGrading
//
//  Created by Gerard Gomez on 4/24/21.
//

import SwiftUI

struct ContentView: View {
    @SceneStorage("SelectedView") var selectedView: String?
    var body: some View {
        TabView(selection: $selectedView) {
            HomeView()
                .tag(HomeView.tag)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            OutcomeView(showFinishedOutcomes: false)
                .tag(OutcomeView.openTag)
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Unfinished")
                }
            OutcomeView(showFinishedOutcomes: true)
                .tag(OutcomeView.closedTag)
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
