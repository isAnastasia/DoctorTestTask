//
//  PriceInfoView.swift
//  DoctorTestTask
//
//  Created by Anastasia Gorbunova on 24.10.2024.
//

import SwiftUI

struct PriceInfoView: View {
    @Environment(\.dismiss) var dismiss
    var viewModel: DoctorViewModel
    var body: some View {
        VStack( spacing: 24) {
            Spacer()
                .frame(height: 16)
            
            ForEach(viewModel.priceInfo, id: \.self) {priceInfo in
                PriceRowView(viewModel: priceInfo)
            }
            Spacer()
                .frame(maxHeight: .infinity)
            
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.lightGray)
        .navigationTitle("Стоимость услуг")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {dismiss()}) {
                    Image(systemName: "chevron.backward")
                        .foregroundStyle(Color.gray)
                        
                }
            }
        }
        
    }

}

#Preview {
    PriceInfoView(viewModel: DoctorViewModel(doctor: DoctorInfoModel(
        id: "1",
        avatar: "avatar1",
        name: "Ольга Александрова",
        surname: "Бардо",
        rating: 3,
        seniority: 5,
        textChatPrice: 300,
        videoChatPrice: 400,
        hospitalPrice: 500,
        minimumPrice: 300,
        specialization: "Педиатр",
        workExpirience: "Детская клиника “РебёнОК",
        category: 1,
        educationLabel: "Санкт-Петербургский политехнический университет Петра Великого",
        nearestReceptionTime: nil,
        isLiked: true)))
}
