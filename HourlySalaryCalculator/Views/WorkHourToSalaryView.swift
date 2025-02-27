//
//  WorkHourToSalaryView.swift
//  HourlySalaryCalculator
//
//  Created by xinyu zhang on 2025-02-27.
//

import SwiftUI

struct WorkHourToSalaryView:View{
    
    //MARK: Stored properties
    @State var viewModel = WorkHourToSalaryViewModel()
    
    //MARK: Computed properties
    var body: some View{
        VStack{
            
            //Output
            if let calculatedResult = viewModel.calculatedResult{
                VStack(spacing:0){
                    WorkHourToSalaryItemView(calculatedResult: calculatedResult)
                        .padding(.bottom,30)
                    
                    //Add a button
                    Button {
                        viewModel.saveResult()
                        // DEBUG: Show how many items are in the resultHistory array
                        print("There are \(viewModel.resultHistory.count) elements in the resultHistory array.")
                    } label: {
                        Text("Save")
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.bottom)
                }
                .frame(height: 250)
                
            } else {
                ContentUnavailableView("Unable to perform conversion", systemImage: "gear.badge.questionmark", description: Text(viewModel.recoverySuggestion))
                    .frame(height: 250)

            }
            
            TextField("Enter a number of hours worked in a week",text:$viewModel.providedhoursWorkedInAWeek)
                .textFieldStyle(.roundedBorder)
            TextField("Enter hourly salary",text: $viewModel.providedhourlySalary)
                .textFieldStyle(.roundedBorder)
            
            HStack {
                Text("History")
                    .font(.title2)
                    .bold()
                
                Spacer()
            }
            .padding(.top)
            
            
            List(viewModel.resultHistory){currentResult in
                WorkHourToSalaryItemView(calculatedResult: currentResult)
            }
            .listStyle(.plain)
                }
        .navigationTitle("Salary Calculator")
        .padding()
        
            }
        }
#Preview{
    NavigationStack {
        WorkHourToSalaryView()
    }
}
