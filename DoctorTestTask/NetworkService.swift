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
        // Получаем путь к файлу
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            fatalError("Не удалось найти файл users.json")
        }
        
        do {
            // Чтение данных из файла
            let data = try Data(contentsOf: url)
            
            // Декодируем JSON данные в массив объектов User
            let decoder = JSONDecoder()
            let users = try decoder.decode(Response.self, from: data)
            
            return users.data.users
        } catch {
            // Обрабатываем возможные ошибки
            print("Ошибка загрузки данных: \(error)")
            return nil
        }
    }
}
