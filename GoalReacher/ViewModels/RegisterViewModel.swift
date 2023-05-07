//
//  RegisterViewModel.swift
//  GoalReacher
//
//  Created by Linda Bergsängel on 2023-05-07.
//

import Foundation

class RegisterViewModel: ObservableObject{
    @Published var email = ""
    @Published var name = ""
    @Published var password = ""
    
    init() {}
    
    func register() {
        guard validate() else {
            return
        }
    }
    
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        
        guard password.count >= 6 else {
                return false
        }
        
        return true
    }
}
