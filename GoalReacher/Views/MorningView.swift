//
//  Morning.swiftwscaw
//  GoalReacher
//
//  Created by Linda Bergsängel on 2023-05-05.
//

import SwiftUI
import FirebaseAuth

struct MorningView: View {
@StateObject var vm = MorningViewModel()
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
                Text(String(vm.morningTodos.count))
                    List {
                        
                        ForEach(vm.morningTodos) { model in
                            HStack{
                                Text(model.title)
                                Text(String(model.streakDays)+" / " + model.wantedDaysToDo)
                                Spacer()
                                Image("star")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .padding(20)
                                    .foregroundColor(Color.yellow)
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

struct MorningView_Previews: PreviewProvider {
    static var previews: some View {
        MorningView()
    }
}
