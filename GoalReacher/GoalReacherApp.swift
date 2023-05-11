//
//  GoalReacherApp.swift
//  GoalReacher
//
//  Created by Linda Bergsängel on 2023-05-05.
//

import SwiftUI
import FirebaseCore

@main
struct GoalReacherApp: App {
    @StateObject var MustDoTodayVM = MustDoTodayViewModel()
    init() {
        FirebaseApp.configure()
    }
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView(MustDoTodayVM: MustDoTodayVM)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
