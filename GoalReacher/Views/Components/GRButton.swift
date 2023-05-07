//
//  GRButton.swift
//  GoalReacher
//
//  Created by Linda Bergsängel on 2023-05-06.
//

import SwiftUI

struct GRButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    var body: some View {
        Button{
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
    }
}

struct GRButton_Previews: PreviewProvider {
    static var previews: some View {
        GRButton(title: "Value", background: .pink){
            //action
        }
    }
}
