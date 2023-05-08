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
    
    init() {}
    
    /*
    // SAVE TO FIRESTORE
    func saveTodo(title: String, lastDate: Date, count: Int) {
        guard let user = Auth.auth().currentUser else {return}
            let todoRef = db.collection("users").document(user.uid).collection("todos")
                
        let todo = ToDoItem(title: title,lastDate: lastDate,count: count)
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
