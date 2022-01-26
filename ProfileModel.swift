//
//  ProfileModel.swift
//  Profile
//
//  Created by Алексей Лосев on 25.01.2022.
//

import Foundation

struct Profile: Codable {
    let results: [Result]
}
struct Result: Codable {
    let gender: String
    let name: Name
    let location: Location
    let dob: Dob
    let picture: Picture
}
struct Name: Codable {
    let first: String
}
struct Location: Codable {
    let city,country: String

}
struct Dob: Codable {
    let age: Int
}

struct Picture: Codable {
    let medium: String // large,thumbnail на всякий
}

