//
//  Project-CoreDataHelpers.swift
//  MasteryGrading
//
//  Created by Gerard Gomez on 4/24/21.
//

import Foundation

extension Outcome {
    var outcomeTitle: String {
        title ?? "New Outocme"
    }
    var outcomeDetail: String {
        detail ?? ""
    }
    var outcomeColor: String {
        color ?? "Light Blue"
    }
    static var example: Outcome {
        let controller = DataController(inMemory: true)
        let viewContext = controller.container.viewContext
        
        let outcome = Outcome(context: viewContext)
        outcome.title = "Example Outcome"
        outcome.detail = "This is an example outcome."
        outcome.completed = true
        outcome.closed = true
        outcome.creationDate = Date()
        return outcome
    }
    var outcomeIndicators: [Indicator] {
        let indicatorArray = indicators?.allObjects as? [Indicator] ?? []
        return indicatorArray.sorted { first, second in
            if first.completed == false {
                if second.completed == true {
                    return true
                }
            } else if first.completed == true {
                if second.completed == false {
                    return false
                }
            }
            if first.grade > second.grade {
                return true
            } else if first.grade < second.grade {
                return false
            }
            return first.indicatorCreationDate < second.indicatorCreationDate
        }
    }
    var completionAmount: Double {
        let originalIndicators = indicators?.allObjects as? [Indicator] ?? []
        guard originalIndicators.isEmpty == false else { return 0 }
        
        let completedIndicators = originalIndicators.filter(\.completed)
        return Double(completedIndicators.count) / Double(originalIndicators.count)
    }
}
