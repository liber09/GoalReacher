//
//  MainView.swift
//  GoalReacher
//
//  Created by Linda Bergsängel on 2023-05-07.
//

import SwiftUI

struct MainView: View {
    @StateObject var MustDoTodayVM : MustDoTodayViewModel
    @StateObject var MorningVM : MorningViewModel
    @StateObject var EveningVM : EveningViewModel
    @StateObject var StatisticsVM : StatisticsViewModel
    @ObservedObject var notificationManager: NotificationManager
    let goalReacherVM = GoalReacherVM()
    var body: some View {
        NavigationStack{
        ZStack{
            Image("space")
                .resizable()
                .frame(width: 900, height: 900)
            VStack(alignment: .center, spacing: 30){
                Text(goalReacherVM.getInfoAboutToday())
                    .foregroundColor(Color.white)
                    .font(.system(size: 20))
                NavigationLink(destination: MorningView(vm: MorningVM)) {
                    HStack{
                        Image("star")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .padding(20)
                        
                            Text("Morning")
                                .font(.system(size: 36))
                                .foregroundColor(Color.black)
                        
                        Image(systemName: "arrow.forward")
                            .padding(20)
                            .foregroundColor(Color.black)
                        
                    }
                    .background(Color.white)
                }
                NavigationLink(destination: EveningView(vm: EveningVM)) {
                    HStack{
                        Image("star")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .padding(20)
                        
                        Text("Evening")
                            .font(.system(size: 36))
                            .foregroundColor(Color.black)
                            Image(systemName: "arrow.forward")
                            .padding(20)
                            .foregroundColor(Color.black)
                        
                    }
                    .background(Color.white)
                }
                NavigationLink(destination: MustDoTodayView(vm: MustDoTodayVM)) {
                    HStack{
                        Image("star")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .padding(20)
                        
                        Text("Must Do Today")
                            .font(.system(size: 36))
                            .foregroundColor(Color.black)
                        
                        Image(systemName: "arrow.forward")
                            .padding(20)
                            .foregroundColor(Color.black)
                    }
                    .background(Color.white)
                }
                NavigationLink(destination: AddNew(notificationManager: notificationManager)) {
                    Image(systemName: "plus.diamond.fill")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .foregroundColor(Color.white)
                }
                NavigationLink(destination: StatisticsView(vm: StatisticsVM)) {
                    HStack{
                        Image("star")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .padding(20)
                        
                        Text("Statistics")
                            .font(.system(size: 36))
                            .foregroundColor(Color.black)
                        
                        Image(systemName: "arrow.forward")
                            .padding(20)
                            .foregroundColor(Color.black)
                    }
                    .background(Color.white)
                }
                
            }
            }
         }
        .onAppear{
            notificationManager.requestAuthorization()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(MustDoTodayVM: MustDoTodayViewModel(),MorningVM: MorningViewModel(),EveningVM: EveningViewModel(), StatisticsVM: StatisticsViewModel(), notificationManager: NotificationManager())
    }
}
