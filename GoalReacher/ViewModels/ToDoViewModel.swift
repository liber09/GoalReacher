//
//  ToDoViewModel.swift
//  GoalReacher
//
//  Created by Linda Bergsängel on 2023-05-07.
//
import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class ToDoViewModel: ObservableObject {
    @Published var title = ""
    @Published var wantsRemainder = false
    @Published var morning = false
    @Published var evening = false
    @Published var streakDays = 0
    @Published var daysDone = [Date]()
    @Published var remainderDate = Date()
    @Published var wantedDaysToDo = "0"
    @Published var selectedDate = Date()
    
    @Published var todos = [ToDoItem]()
    
    let db = Firestore.firestore()
    let auth = Auth.auth()
    
    init() {}
    
    func save(title: String, wantsRemainder: Bool, lastDate: Date, streakDays: Int, selectedDate: Date, done: Bool, daysToDo: String){
        guard let user = auth.currentUser else {return}
        let todoRef = db.collection("users").document(user.uid).collection("todos")
        let todo = ToDoItem(title: title, wantsRemainder: wantsRemainder, morning: morning, evening: evening, lastDate: Date(),streakDays: 0, selectedDate: selectedDate, done: false, wantedDaysToDo: wantedDaysToDo, doneDates: daysDone, remainderDate: remainderDate)
                do {
                    try todoRef.addDocument(from: todo)
                } catch {
                    print("Error saving to db")
                }
            }
    
        func listen2FS (){
            
            guard let user = auth.currentUser else {return}
            
            let itemsRef = db.collection("users").document(user.uid).collection("todos")
              
            itemsRef.addSnapshotListener() {
                snapshot, err in
                
                guard let snapshot = snapshot else {return}
                
                if let err = err {
                    print("error\(err)")
                } else {
                    
                    self.todos.removeAll()
                    
                    for document in snapshot.documents{
                        
                        do{
                            
                            let todo = try document.data(as : ToDoItem.self)
                            self.todos.append(todo)
                         print("vi hämtar")
                   
                        } catch {
                            print("Error")
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
                    print("TOdo document does not exist")
                }
            }
        }
}

