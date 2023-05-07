//
//  ToDoViewModel.swift
//  GoalReacher
//
//  Created by Linda Bergsängel on 2023-05-07.
//
import Foundation



class ToDoViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var weekDays: [String] = []
    @Published var wantsNotification: Bool = false
    @Published var notificationText: String = ""
    @Published var notificationDate: Date = Date()
    
}
