//
//  DoctorInfoModel.swift
//  DoctorTestTask
//
//  Created by Anastasia Gorbunova on 18.10.2024.
//

import Foundation

struct DoctorInfoModel: Identifiable {
    var id: String = ""
    var avatar: String?
    var name: String = ""
    var surname: String = ""
    var rating: Double = 0.0
    var seniority: Int = 0// стаж работы
    
    var textChatPrice: Int = 0
    var videoChatPrice: Int = 0
    var hospitalPrice: Int = 0
    var minimumPrice: Int = 0
    
    var specialization: String?
    var workExpirience: String?
    var educationLabel: String?
    var category: Int = 0
    var nearestReceptionTime: Int?
    var isLiked: Bool = false
    
    init(id: String, avatar: String? = nil, name: String, surname: String, rating: Double, seniority: Int, textChatPrice: Int, videoChatPrice: Int, hospitalPrice: Int, minimumPrice: Int, specialization: String, workExpirience: String, category: Int, educationLabel: String? = nil,  nearestReceptionTime: Int?, isLiked: Bool) {
        self.id = id
        self.avatar = avatar
        self.name = name
        self.surname = surname
        self.rating = rating
        self.seniority = seniority
        self.textChatPrice = textChatPrice
        self.videoChatPrice = videoChatPrice
        self.hospitalPrice = hospitalPrice
        self.minimumPrice = minimumPrice
        self.specialization = specialization
        self.workExpirience = workExpirience
        self.educationLabel = educationLabel
        self.category = category
        self.nearestReceptionTime = nearestReceptionTime
        self.isLiked = isLiked
    }
    
    init(from user: User) {
        self.id = user.id
        self.name = user.firstName + " " + user.patronymic
        self.surname = user.lastName
        self.rating = user.rating
        self.seniority =  user.seniority
        self.textChatPrice = user.textChatPrice
        self.videoChatPrice = user.videoChatPrice
        self.hospitalPrice = user.hospitalPrice
        self.minimumPrice = [user.hospitalPrice, user.textChatPrice, user.videoChatPrice].min() ?? user.textChatPrice
        if user.specialization.isEmpty {
            self.specialization = nil
        } else {
            self.specialization = user.specialization.map{$0.name}.joined(separator: ", ")
        }
        
        self.educationLabel = user.educationTypeLabel?.name
        self.workExpirience = user.workExpirience.filter { workPlace in
            if workPlace.untilNow {
                return true
            }
            return false
        }.first?.organization
        self.category = user.category
        self.nearestReceptionTime =  user.nearestReceptionTime
        self.isLiked = user.isFavorite
    }
    
    init(){}
    
}



