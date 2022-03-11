//
//  User.swift
//  ResponsiveUI
//
//  Created by xlf on 2022/3/11.
//

import SwiftUI

struct User: Identifiable {
    var id = UUID().uuidString
    var name: String
    var image: String
    var title: String
}

var users: [User] = [
    User(name: "iJusting", image: "User", title: "Apple event is here"),
    User(name: "Jean", image: "User", title: "Apple123 event is here"),
    User(name: "Masks", image: "User", title: "Apple333 event is here"),
    User(name: "Oli", image: "User", title: "Apple444 event is here")
    
]
