//
//  DoctorViewModel.swift
//  DoctorTestTask
//
//  Created by Anastasia Gorbunova on 23.10.2024.
//

import Foundation

final class DoctorViewModel: ObservableObject {
    @Published var doctor = DoctorInfoModel()
    var dataArray: [String:String] = [:]
    var priceInfo: [PriceViewModel]
    
    //MARK: - Init
    init(doctor: DoctorInfoModel) {
        self.doctor = doctor

        dataArray["clock"] = "Стаж работы: " + DoctorViewModel.getSeniority(years: doctor.seniority)
        switch doctor.category {
        case 1:
            dataArray["medicine"] = "Врач второй категории"
        case 2:
            dataArray["medicine"] = "Врач первой категории"
        case 3:
            dataArray["medicine"] = "Врач высшей категории"
            
        default:
            break
        }

        if doctor.educationLabel != nil {
            dataArray["cap"] = doctor.educationLabel!
        }
        if doctor.workExpirience != nil {
            dataArray["location"] = doctor.workExpirience!
        }
        
        priceInfo = [PriceViewModel(price: doctor.videoChatPrice, tag: "30 мин", name: "Видеоконсультация"),
                     PriceViewModel(price: doctor.textChatPrice, tag: "30 мин", name: "Чат с врачом"),
                     PriceViewModel(price: doctor.hospitalPrice, tag: "В клинике", name: "Приём в клинике")]
        
    }
    //MARK: - Actions
    public func tapLike() {
        doctor.isLiked.toggle()
    }
    
    public func makeAnAppointment() {
        
    }
    
    //MARK: - Formatting
    public func getRating() -> Int {
        return Int(round(doctor.rating))
    }
    
    public func getPriceLabel() -> String {
        return "от \(doctor.minimumPrice) ₽"
    }
    
    public func getSpecialisation() -> String {
        let seniority = "стаж " + DoctorViewModel.getSeniority(years: doctor.seniority)
        if let spec = doctor.specialization {
            return spec + " * " + seniority
        }
        return seniority
    }
    
    public func isThereNearestTime() -> Bool{
        if (doctor.nearestReceptionTime != nil) {
            return true
        }
        return false
    }
    
    static private func getSeniority(years: Int) -> String {
        switch years {
        case 1:
            return "\(years) год"
        case 2,3,4:
            return "\(years) года"
        default:
            return "\(years) лет"
        }
    }
    
}
