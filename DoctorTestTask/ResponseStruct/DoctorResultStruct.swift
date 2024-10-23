//
//  DoctorInfoStruct.swift
//  DoctorTestTask
//
//  Created by Anastasia Gorbunova on 23.10.2024.
//

import Foundation

struct UserData: Codable {
    let users: [User]
}

struct Response: Codable {
    let count: Int
    let data: UserData
}

