//
//  HourlySalaryCalculator.swift
//  HourlySalaryCalculator
//
//  Created by xinyu zhang on 2025-02-27.
//

import Foundation

struct WorkHourToSalary: Identifiable{
    
    // MARK: Stored properties
    let id = UUID()
    let hoursWorkedInAWeek: Double
    let hourlySalary: Double
    
    //MARK: Computed properties
    var totalWeeklyEarning: Double{
        return (hoursWorkedInAWeek * hourlySalary)
    }
}

