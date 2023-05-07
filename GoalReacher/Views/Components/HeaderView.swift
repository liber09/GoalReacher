//
//  HeaderView.swift
//  GoalReacher
//
//  Created by Linda Bergsängel on 2023-05-06.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subTitle: String
    let angle: Double
    let background: Color  //Color(red: 255/255, green:16/255,blue: 240/255)
    var body: some View {
       ZStack{
           RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
            VStack{
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .bold()
                Text(subTitle)
                    .foregroundColor(Color.white)
                    .font(.system(size: 30))
            }
            .padding(.top, 80)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 350)
        .offset(y: -150)
           
    }
   
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title", subTitle: "Subtitle", angle: 15, background: Color(red: 255/255, green:16/255,blue: 240/255))
    }
}
