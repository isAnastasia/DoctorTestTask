//
//  WorkPlaceStruct.swift
//  DoctorTestTask
//
//  Created by Anastasia Gorbunova on 24.10.2024.
//

import Foundation

struct WorkPlace: Codable {
    let id: Int
    let organization: String
    let position: String
    let startDate: Int
    let endDate: Int?
    let untilNow: Bool
    let isModerated: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case organization
        case position
        case startDate = "start_date"
        case endDate = "end_date"
        case untilNow = "until_now"
        case isModerated = "is_moderated"
    }
    
}
