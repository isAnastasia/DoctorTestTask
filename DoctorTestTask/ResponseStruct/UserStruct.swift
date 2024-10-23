//
//  UserStruct.swift
//  DoctorTestTask
//
//  Created by Anastasia Gorbunova on 24.10.2024.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let avatar: String?
    let firstName: String
    let lastName: String
    let patronymic: String
    
    let specialization: [Specialization]
    let rating: Double
    let seniority: Int // стаж
    let category: Int
    let nearestReceptionTime: Int?
    let textChatPrice: Int
    let videoChatPrice: Int
    let hospitalPrice: Int
    let workExpirience: [WorkPlace]
    
    let educationTypeLabel: EducationTypeLabel?
    
    let isFavorite: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case avatar
        case firstName = "first_name"
        case lastName = "last_name"
        case patronymic
        case specialization
        case rating = "ratings_rating"
        case seniority
        case category
        case nearestReceptionTime = "nearest_reception_time"
        case textChatPrice = "text_chat_price"
        case videoChatPrice = "video_chat_price"
        case hospitalPrice = "hospital_price"
        case workExpirience = "work_expirience"
        case educationTypeLabel = "education_type_label"
        case isFavorite = "is_favorite"
    }
}
