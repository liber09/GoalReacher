//
//  AddViewModel.swift
//  GoalReacher
//
//  Created by Linda Bergsängel on 2023-05-08.
//

import Foundation
import Firebase

class AddViewModel: ObservableObject{
    let db = Firestore.firestore()
    
    @Published var title = ""
    @Published var wantsRemainer = false
    @Published var streakDays = 0
    @Published var morninig = false
    @Published var evening = false
    @Published var todaysMustDo = false
    @Published var firstDay = Date()
    @Published var daysDone = [Date]()
    @Published var schema = [Date]()
    
    init() {}
    
    
    /*
     //Check streak logic
     If schema says you have selected to do this todo on mon,wed, fri then your streak will continue even if you ",miss days"
     
     let title: String
     let wantsRemainer: Bool
     let lastDate: Date
     let streakDays: Int
     let morning: Bool
     let evening: Bool
     
     let firstDay: Date
     let DaysDone: [Date]
     let RemainderDate: Date
     let Schema: [Date]
    
    // SAVE TO FIRESTORE
    func saveTodo(title: String, lastDate: Date, streakDays: Int, morning: Bool, evening: Bool, firstDay Date, Daysdone [Date], RemainderDate Date, schema Date[]) {
        guard let user = Auth.auth().currentUser else {return}
            let todoRef = db.collection("users").document(user.uid).collection("todos")
                
        let todo = ToDoItem(title: title,lastDate: lastDate,streakDays: streakDays,)
            do {
                try todoRef.addDocument(from: todo)
            } catch {
                print("Error saving to db")
            }
        }
     */
    //GET FROM FIRESTORE
    
    //UPDATE FIRESTORE
}
