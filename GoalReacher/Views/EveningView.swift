//
//  Evening.swift
//  GoalReacher
//
//  Created by Linda Bergsängel on 2023-05-05.
//

import SwiftUI

struct EveningView: View {
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
                                    Text("Evening").font(.headline)
                                        .foregroundColor(Color.white)
                                }
                            }
                        }
                }
                Text("Hello, Evening!")
            }
        }
    }
}

struct EveningView_Previews: PreviewProvider {
    static var previews: some View {
        EveningView()
    }
}
