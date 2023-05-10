//
//  Morning.swiftwscaw
//  GoalReacher
//
//  Created by Linda Bergsängel on 2023-05-05.
//

import SwiftUI
import FirebaseAuth

struct MorningView: View {
@StateObject var viewModel = MorningViewModel()
    var body: some View {
        NavigationView{
            VStack{
                ZStack{

                    Image("space")
                        .resizable()
                        .frame(width: 1000, height: 1000)
                    VStack{
                        Text("Morning").font(.headline)
                            .foregroundColor(Color.white)
                    }
                    

                }
                Text("Hello, Morning!")
            }
        }
    }
}

struct MorningView_Previews: PreviewProvider {
    static var previews: some View {
        MorningView()
    }
}
