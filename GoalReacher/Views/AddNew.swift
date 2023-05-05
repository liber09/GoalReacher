//
//  AddNew.swift
//  GoalReacher
//
//  Created by Linda Bergsängel on 2023-05-05.
//

import SwiftUI

struct AddNew: View {
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
                                    Text("Add New").font(.headline)
                                        .foregroundColor(Color.white)
                                }
                            }
                        }
                }
                Text("Hello, AddNew!")
            }
        }
    }
}

struct AddNew_Previews: PreviewProvider {
    static var previews: some View {
        AddNew()
    }
}
