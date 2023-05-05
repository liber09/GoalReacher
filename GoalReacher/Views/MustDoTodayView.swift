//
//  MustDoToday.swift
//  GoalReacher
//
//  Created by Linda Bergsängel on 2023-05-05.
//

import SwiftUI

struct MustDoTodayView: View {
    var body: some View {
        NavigationView{
            Text("")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .principal) {
                        VStack{
                            Text("Must Do Today").font(.headline)
                        }
                    }
                }
        }
        Text("Hello, Today!")
    }
}

struct MustDoTodayView_Previews: PreviewProvider {
    static var previews: some View {
        MustDoTodayView()
    }
}
