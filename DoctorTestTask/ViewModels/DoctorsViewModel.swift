//
//  DoctorsViewModel.swift
//  DoctorTestTask
//
//  Created by Anastasia Gorbunova on 24.10.2024.
//

import Foundation

final class DoctorsViewModel: ObservableObject {
    static var shared: DoctorsViewModel = DoctorsViewModel()
    @Published var doctors: [DoctorInfoModel] = []
    
    func loadUsers() {
        guard let users = NetworkService.shared.loadDoctors(filename: "test") else {
            print("Error")
            return
        }
        doctors = convertUsersToDoctorsInfo(users: users)
    }
    
    private func convertUsersToDoctorsInfo(users: [User]) -> [DoctorInfoModel] {
        users.map{DoctorInfoModel(from: $0)}
    }
    
}
