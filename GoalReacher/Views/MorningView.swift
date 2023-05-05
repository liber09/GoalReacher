//
//  Morning.swift
//  GoalReacher
//
//  Created by Linda Bergsängel on 2023-05-05.
//

import SwiftUI

struct MorningView: View {
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
                                    Text("Morning").font(.headline)
                                        .foregroundColor(Color.white)
                                }
                            }
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
