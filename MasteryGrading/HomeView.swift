//
//  HomeView.swift
//  MasteryGrading
//
//  Created by Gerard Gomez on 4/24/21.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var dataController: DataController
    var body: some View {
        NavigationView {
            VStack {
                Button("Add Data") {
                    dataController.deleteAll()
                    try? dataController.createSampleData()
                }
            }
            .navigationTitle("Home")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var dataController = DataController.preview
    static var previews: some View {
        HomeView()
            .environment(\.managedObjectContext, dataController.container.viewContext)
            .environmentObject(dataController)
    }
}
