//
//  AddNew.swift
//  GoalReacher
//
//  Created by Linda Bergsängel on 2023-05-05.
//

import SwiftUI

struct AddNew: View {
    @EnvironmentObject var toDoItemModel: ToDoViewModel
    var body: some View {
        NavigationView{
            VStack(spacing: 15){
                TextField("Title", text: $toDoItemModel.title)
            
            }
        }
    }
}

struct AddNew_Previews: PreviewProvider {
    static var previews: some View {
        AddNew()
    }
}
