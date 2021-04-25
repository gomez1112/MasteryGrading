//
//  IndicatorRowView.swift
//  MasteryGrading
//
//  Created by Gerard Gomez on 4/24/21.
//

import SwiftUI

struct IndicatorRowView: View {
    @ObservedObject var indicator: Indicator
    var body: some View {
        NavigationLink(destination: EditIndicatorView(indicator: indicator)) {
            Text(indicator.indicatorTitle)
        }
    }
}

struct IndicatorRowView_Previews: PreviewProvider {
    static var previews: some View {
        IndicatorRowView(indicator: Indicator.example)
    }
}
