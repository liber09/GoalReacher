//
//  StatisticsView.swift
//  GoalReacher
//
//  Created by Linda Bergsängel on 2023-05-12.
//

import SwiftUI

struct StatisticsView: View {
    @ObservedObject var vm : StatisticsViewModel
    @State var selectedTimePeriod: TimePeriod = .day
    @State var selectedDate: Date = Date()
    @State var dateRange: [Date] = [Date(), Date()]
    @State var calendar = Calendar(identifier: .iso8601)
    
    
    enum TimePeriod: String, CaseIterable, Identifiable {
        case day, week, month
        var id: Self { self }
    }
    var body: some View {
        NavigationView {
            VStack {
                
                HStack {
                    DatePicker("Choose date:", selection: $selectedDate, displayedComponents: .date)
                        .datePickerStyle(.compact)
                        .padding()
                }
                Picker("Time period:", selection: $selectedTimePeriod) {
                    Text("Today").tag(TimePeriod.day)
                    Text("This Week").tag(TimePeriod.week)
                    Text("This Month").tag(TimePeriod.month)
                }
                .pickerStyle(.segmented)
                .padding()
                .onAppear {
                    dateRange = vm.getDateRange(selectedDate: selectedDate, range: selectedTimePeriod.rawValue)
                    vm.getTodosRangeFromFirestore(to: dateRange[1])
                }
                .onChange(of: selectedTimePeriod) { _ in
                    dateRange = vm.getDateRange(selectedDate: selectedDate, range: selectedTimePeriod.rawValue)
                    vm.getTodosRangeFromFirestore(to: dateRange[1])
                }
                .onChange(of: selectedDate) { _ in
                    dateRange = vm.getDateRange(selectedDate: selectedDate, range: selectedTimePeriod.rawValue)
                    vm.getTodosRangeFromFirestore(to: dateRange[1])
                }
                
                List {
                    ForEach(vm.statisticsTodos) { todo in
                        VStack {
                            let numberOfDone = todo.getDoneInDateRange(from: dateRange[0], to: dateRange[1])
                            if numberOfDone == 1 {
                                Text("\(todo.title) has been done 1 time this \(selectedTimePeriod.rawValue)")
                            } else if numberOfDone == 0 {
                                Text("\(todo.title) hasn't been done this \(selectedTimePeriod.rawValue).")
                            } else {
                                Text("\(todo.title) has been done \(todo.getDoneInDateRange(from: dateRange[0], to: dateRange[1])) times this \(selectedTimePeriod.rawValue)")
                            }
                            let streak = todo.getStreak()
                            switch streak {
                            case 0:
                                Text("You have no streak going at the moment.")
                            default:
                                Text("Your current streak is \(streak).")
                            }
                        }
                    }
                }
            }
            .navigationBarItems(leading: Text("Statistics")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .padding()
            )
        }
    }
}
