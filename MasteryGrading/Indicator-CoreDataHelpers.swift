//
//  Item-CoreDataHelpers.swift
//  MasteryGrading
//
//  Created by Gerard Gomez on 4/24/21.
//

import Foundation

extension Indicator {
    var indicatorTitle: String {
        title ?? ""
    }
    var indicatorDetail: String {
        detail ?? ""
    }
    var indicatorCreationDate: Date {
        creationDate ?? Date()
    }
    
    static var example: Indicator {
        let controller = DataController(inMemory: true)
        let viewContext = controller.container.viewContext
        
        let indicator = Indicator(context: viewContext)
        indicator.title = "Example Indicator"
        indicator.detail = "This is an example indicator"
        indicator.grade = 3
        indicator.creationDate = Date()
        return indicator
    }
}
