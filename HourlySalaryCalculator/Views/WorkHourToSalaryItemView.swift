//
//  WorkHourToSalaryItemView.swift
//  HourlySalaryCalculator
//
//  Created by xinyu zhang on 2025-02-27.
//

import SwiftUI

struct WorkHourToSalaryItemView:View{
    
    //MARK: Stored properties
    let calculatedResult: WorkHourToSalary
    
    //MARK: Computed properties
    var body: some View{
        HStack(spacing: 0){
            Text("\(calculatedResult.hoursWorkedInAWeek.formatted(.number.precision(.significantDigits(1...3))))h/week")
            Text("$\(calculatedResult.totalWeeklyEarning.formatted(.number.precision(.significantDigits(1...3))))CAD")
        }
        .font(.largeTitle)
    }
}

