//
//  OutcomeView.swift
//  MasteryGrading
//
//  Created by Gerard Gomez on 4/24/21.
//

import SwiftUI

struct OutcomeView: View {
    let showFinishedOutcomes: Bool
    let outcomes: FetchRequest<Outcome>
    
    init(showFinishedOutcomes: Bool) {
        self.showFinishedOutcomes = showFinishedOutcomes
        
        outcomes = FetchRequest<Outcome>(entity: Outcome.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Outcome.creationDate, ascending: false)], predicate: NSPredicate(format: "closed = %d", showFinishedOutcomes))
    }
    var body: some View {
        NavigationView {
            List {
                ForEach(outcomes.wrappedValue) { outcome in
                    Section(header: Text(outcome.title ?? "")) {
                        ForEach(outcome.indicators?.allObjects as? [Indicator] ?? []) { indicator in
                            Text(indicator.title ?? "")
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle(showFinishedOutcomes ? "Finished Outcomes" : "Unfinished Outcomes")
        }
    }
}

struct OutcomeView_Previews: PreviewProvider {
    static var dataController = DataController.preview
    static var previews: some View {
        OutcomeView(showFinishedOutcomes: false)
            .environment(\.managedObjectContext, dataController.container.viewContext)
            .environmentObject(dataController)
    }
}
