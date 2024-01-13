//
//  User.swift
//  DelegationApp
//
//  Created by Maxim Makarov on 13.01.2024.
//

import Foundation

struct User {
    var name: String
    var surname: String
    
    // Геттер
    var fullName: String {
        "\(name) \(surname)"
    }
}
