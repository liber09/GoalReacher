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
            
        func streakCounter(todo: ToDoItem) {
            guard let user = Auth.auth().currentUser, let todoId = todo.id else { return }
            
            let todoRef = db.collection("users").document(user.uid).collection("todos").document(todoId)
            todoRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    let data = document.data()
                    if let dateTracker = data?["dateTracker"] as? [Timestamp] {
                        let today = Date()
                        let calendar = Calendar.current
                        
                        
                        var currentStreak = 0
                        
                        if dateTracker.contains(where: { calendar.isDate($0.dateValue(), inSameDayAs: today) }){
                            currentStreak += 1}
                        
                        
                        // Check if habit was done yesterday and compute streak
                        if let yesterday = calendar.date(byAdding: .day, value: -1, to: today),
                           dateTracker.contains(where: { calendar.isDate($0.dateValue(), inSameDayAs: yesterday) }) {
                            currentStreak += 1
                            
                            // Continue checking back one day at a time
                            //OBS måste nog sortera listan från firebase först om jag lägga till en funktioon där man kan lägga till ifall man har glömt bocka i dagen innan - för det funkar inte im det är på fel plats på datedrackern
                            var currentDay = yesterday
                            
                            while let previousDay = calendar.date(byAdding: .day, value: -1, to: currentDay),
                                  dateTracker.contains(where: { calendar.isDate($0.dateValue(), inSameDayAs: previousDay) }) {
                                currentStreak += 1
                                currentDay = previousDay
                            }
                        }
                        
                        todoRef.updateData(["currentStreak": currentStreak])
                    }                              } else {
                        print("Todo document does not exist")
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
    
    }

