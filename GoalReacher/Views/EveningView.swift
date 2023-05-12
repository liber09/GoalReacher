//
//  Evening.swift
//  GoalReacher
//
//  Created by Linda Bergsängel on 2023-05-05.
//

import SwiftUI

struct EveningView: View {
    @StateObject var vm = EveningViewModel()
    var body: some View {
        NavigationView{
            VStack{
                //ZStack{
                    //Image("space")
                      //  .resizable()
                      //  .frame(width: 1000, height: 1000)
                    Text("")
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar{
                            ToolbarItem(placement: .principal) {
                            }
                        }
                Text(String(vm.eveningTodos.count))
                    List {
                        
                        ForEach(vm.eveningTodos) { model in
                            HStack{
                                Text(model.title)
                                Text(String(model.streakDays)+" / " + model.wantedDaysToDo)
                                Spacer()
                                
                            }
                        }
                    //}
                }
                .onAppear(){
                    vm.listen2FS()
                }
            }
        }
    }
}

struct EveningView_Previews: PreviewProvider {
    static var previews: some View {
        EveningView()
    }
}
