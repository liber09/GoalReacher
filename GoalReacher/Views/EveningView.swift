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
            Text("")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .principal) {
                        VStack{
                            Text("Evening").font(.headline)
                        }
                    }
                }
        }
        Text("Hello, Evening!")
    }
}

struct EveningView_Previews: PreviewProvider {
    static var previews: some View {
        EveningView()
    }
}
