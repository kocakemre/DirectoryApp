//
//  Person.swift
//  DirectoryApp
//
//  Created by Emre Kocak on 13.09.2022.
//

import Foundation

class Person {
    var name: String!
    var surname: String!
    var gender: Gender!
    var number: String!
    
    init() {
        
    }
    
    init(name: String, surname: String, gender: Gender, number: String) {
        self.name = name
        self.surname = surname
        self.gender = gender
        self.number = number
    }
}
