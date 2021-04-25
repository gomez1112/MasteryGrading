//
//  EditIndicatorView.swift
//  MasteryGrading
//
//  Created by Gerard Gomez on 4/24/21.
//

import SwiftUI

struct EditIndicatorView: View {
    let indicator: Indicator
    @EnvironmentObject var dataController: DataController
    
    @State private var title: String
    @State private var detail: String
    @State private var grade: Int
    @State private var completed: Bool
    
    init(indicator: Indicator) {
        self.indicator = indicator
        
        _title = State(wrappedValue: indicator.indicatorTitle)
        _detail = State(wrappedValue: indicator.indicatorDetail)
        _grade = State(wrappedValue: Int(indicator.grade))
        _completed = State(wrappedValue: indicator.completed)
    }
    var body: some View {
        Form {
            Section(header: Text("Basic settings")) {
                TextField("Indicator name", text: $title.onChange(update))
                TextField("Description", text: $detail.onChange(update))
            }
            Section(header: Text("Grade")) {
                Picker("Grade", selection: $grade.onChange(update)) {
                    Text("NY").tag(1)
                    Text("P").tag(2)
                    Text("HP").tag(3)
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Section {
                Toggle("Mark Completed", isOn: $completed.onChange(update))
            }
        }
        .navigationTitle("Edit Indicator")
        .onDisappear(perform: dataController.save)
        .onDisappear(perform: update)
    }
    
    func update() {
        indicator.outcome?.objectWillChange.send()
        indicator.title = title
        indicator.detail = detail
        indicator.grade = Int16(grade)
        indicator.completed = completed
    }
}

struct EditIndicatorView_Previews: PreviewProvider {
    static var dataController = DataController.preview
    static var previews: some View {
        EditIndicatorView(indicator: Indicator.example)
            .environmentObject(dataController)
    }
}
