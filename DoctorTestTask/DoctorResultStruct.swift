//
//  DoctorInfoStruct.swift
//  DoctorTestTask
//
//  Created by Anastasia Gorbunova on 23.10.2024.
//

import Foundation

//struct DoctorsResultModel: Decodable {
//    let doctors: [Doctor]
//}

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

struct EducationTypeLabel: Codable {
    let id: Int
    let name: String
}

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

// Структура для пользователя
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

//struct Doctor: Identifiable, Codable {
//    let id: String
//    let avatar: String
//    let first_name: String
//    let last_name: String
//    let patronymic: String
//    let ratings_rating: Int
//    
//    let seniority: Int // стаж
//    let is_favorite: Bool
//    let category_label: String
//    let nearest_reception_time: String
//    let text_chat_price: Int
//    let video_chat_price: Int
//    let hospital_price: Int
//    
//    
//}

// Структура для объекта data, который содержит массив пользователей
struct UserData: Codable {
    let users: [User]
}

// Основная структура, которая содержит количество пользователей и данные
struct Response: Codable {
    let count: Int
    let data: UserData
}

