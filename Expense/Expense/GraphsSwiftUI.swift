//
//  GraphsSwiftUI.swift
//  Expense
//
//  Created by Student on 5/4/22.
//

import SwiftUI
import SwiftUICharts

let incomeStyle = ChartStyle(backgroundColor: Color.white, accentColor: Color.black, gradientColor: GradientColor.init(start: Color.green, end: Color.green), textColor: Color.black, legendTextColor: Color.black, dropShadowColor: Color.black)
let debtStyle = ChartStyle(backgroundColor: Color.white, accentColor: Color.black, gradientColor: GradientColor(start: Color.red, end: Color.red), textColor: Color.black, legendTextColor: Color.black, dropShadowColor: Color.black)
struct GraphsSwiftUI: View {
    var body: some View {
        VStack {
            Spacer()
            BarChartView(data: ChartData(values: [
            ("Jim", 1),
            ("Todd", 2),
            ("Bobby", 3)
            ]), title: "Income", style: incomeStyle)
            Spacer()
            PieChartView(data: [10002030, 39929293], title: "Income Vs Debt")
            Spacer()
            BarChartView(data: ChartData(values: [
            ("Jim", 1),
            ("Todd", 2),
            ("Bobby", 3)
            ]), title: "Debt", style: debtStyle)
            Spacer()
        }
        
    }
}

struct GraphsSwiftUI_Previews: PreviewProvider
{
    static var previews: some View
    {
        GraphsSwiftUI()
    }
}
