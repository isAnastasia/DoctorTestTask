//
//  SpecializationStruct.swift
//  DoctorTestTask
//
//  Created by Anastasia Gorbunova on 24.10.2024.
//

import Foundation

struct Specialization: Codable {
    let id: Int
    let name: String
    let isModerated: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case isModerated = "is_moderated"
    }
}
