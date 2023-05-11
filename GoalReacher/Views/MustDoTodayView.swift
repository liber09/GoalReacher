//
//  MustDoToday.swift
//  GoalReacher
//
//  Created by Linda Bergsängel on 2023-05-05.
//

import SwiftUI

struct MustDoTodayView: View {
    @StateObject var vm : MustDoTodayViewModel
    var body: some View {
        NavigationView{
            VStack{
                ZStack{
                    Image("space")
                        .resizable()
                        .frame(width: 1000, height: 1000)
                    Text("")
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar{
                            ToolbarItem(placement: .principal) {
                                VStack{
                                    Text("Must Do Today").font(.headline)
                                        .foregroundColor(Color.white)
                                }
                                List {
                                    ForEach(vm.todaysToDos) { model in
                                        HStack{
                                            Text(model.title)
                                            Text(String(model.streakDays)+" / " + model.wantedDaysToDo)
                                        }
                                        
                                    }
                                }
                            }
                        }
                }
                Text("Hello, Today!")
            }
        }
}
}

//struct MustDoTodayView_Previews: PreviewProvider {
//    static var previews: some View {
//        MustDoTodayView()
//    }
//}
                                                                                                                                              

