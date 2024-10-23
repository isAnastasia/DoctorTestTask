//
//  NetworkService.swift
//  DoctorTestTask
//
//  Created by Anastasia Gorbunova on 23.10.2024.
//

import Foundation

final class NetworkService {
    static let shared = NetworkService()
    func loadDoctors(filename fileName: String) -> [User]? {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            fatalError("Не удалось найти файл users.json")
        }
        
        do {
            let data = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            let users = try decoder.decode(Response.self, from: data)
            
            return users.data.users
        } catch {
            print("Ошибка загрузки данных: \(error)")
            return nil
        }
    }
}
