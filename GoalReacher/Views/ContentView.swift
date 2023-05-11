//
//  ContentView.swift
//  GoalReacher
//
//  Created by Linda Bergsängel on 2023-05-05.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    //let GoalReacherVm = GoalReacherVM()
    @StateObject var viewModel = ContentViewModel()
    @StateObject var MustDoTodayVM : MustDoTodayViewModel
    
    var body: some View {
        //NavigationStack{
        //  VStack{
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
            TabView{
                MainView(MustDoTodayVM: MustDoTodayVM)
                    .tabItem{
                        Label("Home", systemImage: "house")
                    }
                    .toolbarBackground(Color(red: 47/255, green:79/255,blue: 79/255))
                ProfileView()
                    .tabItem{
                        Label("Profile", systemImage: "person.circle")
                            .foregroundColor(Color.white)
                    }
                
            }
        }else{
            LoginView()
        }
    }
}
