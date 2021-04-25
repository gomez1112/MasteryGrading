//
//  Binding-OnChange.swift
//  MasteryGrading
//
//  Created by Gerard Gomez on 4/24/21.
//

import SwiftUI

extension Binding  {
    func onChange(_ handler: @escaping () -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue},
            set: { newValue in
                self.wrappedValue = newValue
                handler()
            }
        )
    }
}
