//
//  ToDoViewModel.swift
//  GoalReacher
//
//  Created by Linda Bergsängel on 2023-05-07.
//
import Foundation



class ToDoViewModel: ObservableObject {
    @Published var title = ""
    @Published var wantsRemainer = false
    @Published var streakDays = 0
    @Published var morninig = false
    @Published var evening = false
    @Published var todaysMustDo = false
    @Published var firstDay = Date()
    @Published var daysDone = [Date]()
    
}
