//
//  DoctorInfoView.swift
//  DoctorTestTask
//
//  Created by Anastasia Gorbunova on 22.10.2024.
//

import SwiftUI

struct DoctorDetailView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: DoctorViewModel
    var text: String = "Проводит диагностику и лечение терапевтических больных. Осуществляет расшифровку и снятие ЭКГ. Дает рекомендации по диетологии. Доктор имеет опыт работы в России и зарубежом. Проводит консультации пациентов на английском языке."

    var lines: [String] {
        text.components(separatedBy: .newlines)
    }

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 0) {
                HStack(alignment: .top) {
                    Image("avatar1")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .leading)
                        .clipShape(Circle())
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 8))
                    
                    VStack(alignment: .leading,  spacing: 0) {
                        Text(viewModel.doctor.surname)
                            .font(.boldBodyFont)
                            .frame(height: 24)
                        Text(viewModel.doctor.name)
                            .font(.boldBodyFont)
                            .frame(height: 24)
                    }
                        
                }
                
                Spacer()
                    .frame(height: 20)
                
                VStack(alignment: .leading,spacing: 10) {
                    ForEach(["clock", "medicine", "cap", "location"], id: \.self) { key in
                        if let value = viewModel.dataArray[key] {
                            HStack(spacing: 4) {
                                Image(key)
                                    .foregroundStyle(Color.darkgray)
                                    .frame(width: 24, height: 24)
                                Text(value)
                                    .foregroundStyle(Color.darkgray)
                                    .font(.smallBodyFont)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .frame(height: 24)
                            }
                        }
                        
                    }

                }
                Spacer()
                    .frame(height: 20)
                NavigationLink(destination: PriceInfoView(viewModel: viewModel)) {
                    HStack {
                        Text("Стоимость услуг")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.boldBodyFont)
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                        Text(viewModel.getPriceLabel())
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .font(.boldBodyFont)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16))
                    }
                }
                .buttonStyle(PlainButtonStyle())
                .frame(height: 60)
                .containerRelativeFrame(.horizontal, alignment: .center) { length, axis in
                    return length - 32
                }
                .background(Color.white)
                .roundedCornerWithBorder(lineWidth: 1, borderColor: .silver, radius: 8, corners: [.allCorners])
                
                Spacer()
                    .frame(height: 24)

                LazyVStack(alignment: .leading) {
                    ForEach(lines, id: \.self) { line in
                        Text(line)
                            .font(.smallBodyFont)
                            .lineSpacing(Constants.lineSpacing)
                            .padding(.vertical, 2)
                            
                    }
                }
                
                Spacer(minLength: 24)

                Button(action: {
                    viewModel.makeAnAppointment()
                }) {
                    Text(viewModel.isThereNearestTime() ? "Записаться" : "Нет свободного времени")
                        .frame(height: 24)
                        .font(.boldBodyFont)
                        .foregroundColor(viewModel.isThereNearestTime() ? .white : .black)
                        .frame(maxWidth: .infinity)
                        
                }
                .frame(height: 56)
                .background(viewModel.isThereNearestTime() ? .coral : .bGray)
                .roundedCornerWithBorder(lineWidth: 0.5, borderColor: .silver, radius: 8, corners: [.allCorners])
                
                Spacer()
                    .frame(height: 10)

            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            .background(.lightGray)
            
            .navigationTitle("Педиатр")
            .navigationBarTitleDisplayMode(.inline)
                
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
}

#Preview {
    DoctorDetailView(viewModel: DoctorViewModel(doctor: DoctorInfoModel(
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

