//
//  GoalReacherVM.swift
//  GoalReacher
//
//  Created by Linda Bergsängel on 2023-05-05.
//

import Foundation

class GoalReacherVM {
    
    func getInfoAboutToday() -> String{
        let today = Date()
        let todayString = today.formatted(date: .complete, time: .standard)
        return todayString
    }

}

