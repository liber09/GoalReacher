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
            Text("")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .principal) {
                        VStack{
                            Text("Morning").font(.headline)
                        }
                    }
                }
        }
        Text("Hello, Morning!")
    }
}

struct MorningView_Previews: PreviewProvider {
    static var previews: some View {
        MorningView()
    }
}
