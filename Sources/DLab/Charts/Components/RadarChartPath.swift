//
//  RadarChartPath.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 2/15/21.
//

import SwiftUI

struct RadarChartPath: Shape {
    let data: [Double]

    func path(in rect: CGRect) -> Path {
        guard
            data.count >= 3,
            let minimum = data.min(),
            minimum >= 0,
            let maximum = data.max()
        else { return Path() }

        let radius = min(rect.maxX - rect.midX, rect.maxY - rect.midY)
        var path = Path()

        for (index, entry) in data.enumerated() {
            switch index {
            case 0:
                path.move(to: CGPoint(x: rect.midX + CGFloat(entry / maximum) * cos(CGFloat(index) * 2 * .pi / CGFloat(data.count) - .pi / 2) * radius,
                                      y: rect.midY + CGFloat(entry / maximum) * sin(CGFloat(index) * 2 * .pi / CGFloat(data.count) - .pi / 2) * radius))

            default:
                path.addLine(to: CGPoint(x: rect.midX + CGFloat(entry / maximum) * cos(CGFloat(index) * 2 * .pi / CGFloat(data.count) - .pi / 2) * radius,
                                         y: rect.midY + CGFloat(entry / maximum) * sin(CGFloat(index) * 2 * .pi / CGFloat(data.count) - .pi / 2) * radius))
            }
        }
        path.closeSubpath()
        return path
    }
}
