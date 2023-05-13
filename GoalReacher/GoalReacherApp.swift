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
    @StateObject var viewModel = ContentViewModel()
    @StateObject var MustDoTodayVM = MustDoTodayViewModel()
    @StateObject var MorningVM = MorningViewModel()
    @StateObject var EveningVM = EveningViewModel()
    @StateObject var StatisticsVM = StatisticsViewModel()
    @ObservedObject var notificationManager =  NotificationManager()
    init() {
        FirebaseApp.configure()
    }
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel, MustDoTodayVM: MustDoTodayVM, MorningVM: MorningVM, EveningVM: EveningVM, StatisticsVM: StatisticsVM, notificationManager: notificationManager)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
