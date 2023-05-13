//
//  StatisticsViewModel.swift
//  GoalReacher
//
//  Created by Linda Bergsängel on 2023-05-12.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class StatisticsViewModel: ObservableObject {
    @Published var statisticsTodos = [ToDoItem]()
    
    init() {}
    
    let db = Firestore.firestore()
    let auth = Auth.auth()
    
    func getDateRange(selectedDate: Date, range: String) -> [Date] {
            
            let calendar = Calendar(identifier: .iso8601)
            var startDate = Date()
            var endDate = Date()
            
            enum TimePeriod: String, CaseIterable, Identifiable {
                case week, month, year
                var id: Self { self }
            }
            
            switch range {
            case "day":
                let interval = calendar.dateInterval(of: .day, for: selectedDate)
                startDate = interval?.start ?? Date()
                endDate = interval?.end ?? Date()
            case "month":
                let interval = calendar.dateInterval(of: .month, for: selectedDate)
                startDate = interval?.start ?? Date()
                endDate = interval?.end ?? Date()
                
            case "year":
                let interval = calendar.dateInterval(of: .year, for: selectedDate)
                startDate = interval?.start ?? Date()
                endDate = interval?.end ?? Date()
       
            default:
                let interval = calendar.dateInterval(of: .weekOfYear, for: selectedDate)
                startDate = interval?.start ?? Date()
                endDate = interval?.end ?? Date()
            }
           return [startDate, endDate]
        }
    
    func getTodosRangeFromFirestore(to: Date) {
            
            guard let user = auth.currentUser else {return}
            let nudgeRef = db.collection("users").document(user.uid).collection("todos")
           
            let dateQuery = nudgeRef
                .whereField("selectedDate", isLessThan: to)
            
            dateQuery.getDocuments() { snapshot, error in
                
                guard let snapshot = snapshot else {return}
                
                if let error = error {
                    print("Error getting document \(error)")
                } else {
                    self.statisticsTodos.removeAll()
                    for document in snapshot.documents {
                        do {
                            let todo = try document.data(as: ToDoItem.self)
                            self.statisticsTodos.append(todo)
                            //print(nudge)
                        } catch {
                            print("Error generating list \(error)")
                        }
                    }
                }
            }
            return
        }
}
