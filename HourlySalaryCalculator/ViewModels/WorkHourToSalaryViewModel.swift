//
//  HourlySalaryCalculatorApp.swift
//  HourlySalaryCalculator
//
//  Created by xinyu zhang on 2025-02-27.
//

import Foundation

//View Model

@Observable
class WorkHourToSalaryViewModel{
    
    //MARK: Stored properties
    
    var resultHistory: [WorkHourToSalary] = []
    
    var providedhoursWorkedInAWeek: String = ""
    var providedhourlySalary:String = ""
    var recoverySuggestion: String = ""
    
    //MARK: Computued properties
    var calculatedResult: WorkHourToSalary? {
        
        guard let workhours = Double(providedhoursWorkedInAWeek)else {
            recoverySuggestion = "Please provided a valid number for the work hours in a week"
            return nil
        }
        
        guard let hourlySalary = Double(providedhourlySalary) else {
            recoverySuggestion = "Please provided a valid number for the hourly salary"
            return nil
        }
        recoverySuggestion = ""
        return WorkHourToSalary(hoursWorkedInAWeek: workhours, hourlySalary: hourlySalary)
    }
    
    //MARK: Intitalizer(s)
    
    init(
         providedhoursWorkedInAWeek: String = "",
         providedhourlySalary: String = "",
         recoverySuggestion: String = ""
    ) {
        self.providedhoursWorkedInAWeek = providedhoursWorkedInAWeek
        self.providedhourlySalary = providedhourlySalary
        self.recoverySuggestion = recoverySuggestion
    }
    
    //MARK: Function(s)
    func saveResult(){
        
        if let calculatedResult = self.calculatedResult{
            self.resultHistory.insert(calculatedResult, at: 0)
        }
    }
}
