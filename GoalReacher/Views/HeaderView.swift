//
//  HeaderView.swift
//  GoalReacher
//
//  Created by Linda Bergsängel on 2023-05-06.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
       ZStack{
           RoundedRectangle(cornerRadius: 0)
                .foregroundColor(Color(red: 255/255, green:16/255,blue: 240/255))
                .rotationEffect(Angle(degrees: 15))
            VStack{
                Text("Goal Reacher")
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .bold()
                Text("Get your life together")
                    .foregroundColor(Color.white)
                    .font(.system(size: 30))
            }
            .padding(.top, 30)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 300)
        .offset(y: -100)
           
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
