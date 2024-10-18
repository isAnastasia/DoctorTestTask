//
//  DoctorInfoModel.swift
//  DoctorTestTask
//
//  Created by Anastasia Gorbunova on 18.10.2024.
//

import Foundation

struct DoctorInfo: Identifiable {
    var id: String
    var avatar: String
    var name: String
    var surname: String
    var rating: Int
    var specialization: String
    var price: Int
    var workExpirience: Int
}

let doctorsData: [DoctorInfo] = [
    DoctorInfo(id: "1",
               avatar: "avatar1",
               name: "Дарья Сергеевна",
               surname: "Семенова",
               rating: 5,
               specialization: "Педиатр",
               price: 600,
               workExpirience: 27),
    DoctorInfo(id: "2",
               avatar: "avatar1",
               name: "Кристина Алексеевна",
               surname: "Бардо",
               rating: 4,
               specialization: "Педиатр",
               price: 600,
               workExpirience: 10),
    DoctorInfo(id: "3",
               avatar: "avatar1",
               name: "Максим Иванович",
               surname: "Кашин",
               rating: 3,
               specialization: "Педиатр",
               price: 600,
               workExpirience: 7),
    DoctorInfo(id: "4",
               avatar: "avatar1",
               name: "Даниил Сергеевич",
               surname: "Ракутин",
               rating: 5,
               specialization: "Педиатр",
               price: 600,
               workExpirience: 5)
]
