//
//  ProfileView.swift
//  GoalReacher
//
//  Created by Linda Bergsängel on 2023-05-06.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack{
            Image("space")
                .resizable()
                .frame(width: 900, height: 900)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
