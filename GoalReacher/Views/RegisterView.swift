//
//  RegisterView.swift
//  GoalReacher
//
//  Created by Linda Bergsängel on 2023-05-06.
//

import SwiftUI

struct RegisterView: View {
    @State var email = ""
    @State var name = ""
    @State var password = ""
    
    var body: some View {
        VStack{
            //Header
            HeaderView(title: "Register account", subTitle: "Get your life together", angle: -15, background: Color(red: 255/255, green:16/255,blue: 240/255))
            
            Form{
                TextField("Full name", text: $name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email address", text: $email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Password", text: $password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                GRButton(title: "Create account", background: .blue){
                    //Attempt registration
                }
                padding()
            }
            .background(Color.black)
            VStack{
                Rectangle().fill().background(Color.black)
                    .frame(height: 135)
            }
            Spacer()
        }
        .background(Color.black)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
