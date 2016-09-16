//
//  PieChartHandler.swift
//  PersonalFinance
//
//  Created by Irfan on 9/15/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

class PieChartHandler: NSObject, XYPieChartDataSource, XYPieChartDelegate {
    
    var datasource: [PieChartData]! // dependency --> Constructor Injection
    
    init(datasource: [PieChartData]) {
        self.datasource = datasource
    }
    
    func numberOfSlicesInPieChart(pieChart: XYPieChart!) -> UInt {
        return UInt(datasource.count)
    }
    
    func pieChart(pieChart: XYPieChart!, valueForSliceAtIndex index: UInt) -> CGFloat {
        let chartData = datasource[Int(index)]
        return CGFloat(chartData.value)
    }
    
    func pieChart(pieChart: XYPieChart!, colorForSliceAtIndex index: UInt) -> UIColor! {
        let sliceColor = datasource[Int(index)].color
        return sliceColor
    }
    
    func pieChart(pieChart: XYPieChart!, didSelectSliceAtIndex index: UInt) {
        
    }
    
    func pieChart(pieChart: XYPieChart!, didDeselectSliceAtIndex index: UInt) {
    
    }
    
}
