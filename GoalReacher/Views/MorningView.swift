//
//  Morning.swiftwscaw
//  GoalReacher
//
//  Created by Linda Bergsängel on 2023-05-05.
//

import SwiftUI
import FirebaseAuth

struct MorningView: View {
    @StateObject var vm : MorningViewModel
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
                Text("Morning")
                    .font(.system(size: 36))
                    List {
                        
                        ForEach(vm.morningTodos) { model in
                            HStack{
                                Text(model.title)
                                Text(String(model.streakDays)+" / " + model.wantedDaysToDo)
                                Spacer()
                                Button(action: {
                                    vm.toggle(todo: model)
                                }){
                                    Image(systemName: model.done ? "star.fill" : "star")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                        .padding(20)
                                        .foregroundColor(Color.yellow)
                                }

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
