//
//  MustDoTodayViewModel.swift
//  GoalReacher
//
//  Created by Linda Bergsängel on 2023-05-11.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift


class MustDoTodayViewModel: ObservableObject {
    @Published var todaysToDos = [ToDoItem]()
    @Published var date = Date()
    init() {}
        
        let db = Firestore.firestore()
        let auth = Auth.auth()
        
    func listen2FS (){
            
            guard let user = auth.currentUser else {return}
            
            let itemsRef = db.collection("users").document(user.uid).collection("todos")
              
            itemsRef.addSnapshotListener() {
                snapshot, err in
                
                guard let snapshot = snapshot else {return}
                
                if let err = err {
                    print("error\(err)")
                } else {
                    
                    self.todaysToDos.removeAll()
                    
                    for document in snapshot.documents{
                        
                        do{
                            let todo = try document.data(as : ToDoItem.self)
                            if Calendar.current.isDateInToday(todo.selectedDate){
                                self.todaysToDos.append(todo)
                            }
                            print(todo)
                            
                         
                        } catch {
                            print("Error when removing")
                        }
                    }
                }
            }
            
        }
    
    func toggle(todo: ToDoItem) {
            guard let user = auth.currentUser else {return}
            let todoRef = db.collection("users").document(user.uid).collection("todos")
            let date = Date()
            
            if let id = todo.id {
                todoRef.document(id).updateData(["done" : !todo.done])
                    
                if todo.done == false {
                    if todo.lastDate != date {
                        todoRef.document(id).updateData(["lastDate" : date])
                    }
                    let newStreak = todo.streakDays + 1
                    todoRef.document(id).updateData(["streakDays" : newStreak])
                }else{
                    let newStreak = todo.streakDays - 1
                    todoRef.document(id).updateData(["streakDays" : newStreak])
                }
            }
        }
    

func toggleDoneToday(todo: ToDoItem) {

        guard let user = auth.currentUser else {return}
        
        let todoRef = db.collection("users").document(user.uid).collection("todos")
        let calendar = Calendar.current
        var doneDates = todo.doneDates
        var todoDone = false
        var newStreak = 0
        
        if let id = todo.id {
            if todo.doneDates.contains(where: { calendar.isDate($0, inSameDayAs: date) }) {
                let dateToDelete = todo.doneDates.first(where: {calendar.isDate($0, inSameDayAs: date)})
                doneDates.removeAll{ $0 == dateToDelete }
                todoDone = false
                newStreak = todo.streakDays - 1
                
            } else {
                doneDates.append(date)
                doneDates.sort()
                todoDone = true
                newStreak = todo.streakDays + 1
            }
            todoRef.document(id).updateData(["doneDates" : doneDates, "done" : todoDone, "streakDays" : newStreak])
        }
    }

}
