//
//  PriceViewModel.swift
//  DoctorTestTask
//
//  Created by Anastasia Gorbunova on 24.10.2024.
//

import Foundation

struct PriceViewModel: Hashable {
    var price: Int
    var tag: String
    var name: String
    
    func getPrice() -> String {
        return String(price) + " ₽"
    }
}
