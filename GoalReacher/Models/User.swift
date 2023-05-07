//
//  User.swift
//  GoalReacher
//
//  Created by Linda Bergsängel on 2023-05-07.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
