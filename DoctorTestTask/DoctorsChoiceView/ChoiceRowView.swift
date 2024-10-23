//
//  DoctorChoiceRowView.swift
//  DoctorTestTask
//
//  Created by Anastasia Gorbunova on 18.10.2024.
//

import SwiftUI

struct DoctorChoiceRowView: View {
    @ObservedObject var viewModel: DoctorViewModel

    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image("avatar1")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .leading)
                    .clipShape(Circle())
                    .padding(EdgeInsets(top: 20, leading: 16, bottom: 8, trailing: 8))
                    
                VStack(alignment: .leading, spacing: 8) {
                    VStack(alignment: .leading,  spacing: 0) {
                        Text(viewModel.doctor.surname)
                            .font(.system(size: 16, weight: .bold))
                            .frame(height: 24)
                        Text(viewModel.doctor.name)
                            .font(.system(size: 16, weight: .bold))
                            .frame(height: 24)
                    }
                    
                    HStack(spacing: 2.4) {
                        ForEach(0..<viewModel.getRating()) {_ in
                            Image(systemName: "star.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundStyle(.coral)
                        }
                        ForEach(0..<5 - viewModel.getRating()) {_ in
                            Image(systemName: "star.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundStyle(.gray)
                        }
                    }
                    .frame(width: 69.6, height: 12)
                    Text(viewModel.getSpecialisation())
                        .font(.system(size: 14))
                        .foregroundStyle(.darkGray)
                    Text(viewModel.getPriceLabel())
                        .font(.system(size: 16, weight: .bold))
                }
                .frame(maxWidth: .infinity, minHeight: 126, alignment: .topLeading)
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                
                Button(action: {
                    viewModel.tapLike()
                }) {
                    Image(systemName: viewModel.doctor.isLiked ? "heart.fill" : "heart")
                        .resizable()
                        .frame(width: 20, height: 17.16, alignment: .topTrailing)
                        .padding(EdgeInsets(top: 24, leading: 0, bottom: 0, trailing: 18))
                        .foregroundColor(viewModel.doctor.isLiked ? .coral : .gray)
                        }
            }
            .frame(maxWidth: .infinity)
            
            Button(action: {
                viewModel.makeAnAppointment()
            }) {
                Text(viewModel.isThereNearestTime() ? "Записаться" : "Нет свободного времени")
                    .font(.smallBodyBoldFont)
                    .foregroundStyle(viewModel.isThereNearestTime() ? .white : .black)
            }
            .buttonStyle(.plain)
            .frame( minHeight: 47)
            .containerRelativeFrame(.horizontal, alignment: .center) { length, axis in
                return length - 32
            }
            .background(viewModel.isThereNearestTime() ? .coral : .bGray)
            .cornerRadius(8)
        }
        .containerRelativeFrame(.horizontal, alignment: .center) { length, axis in
            return length
            //return 321
            //return 353
        
            
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
        .background(Color.white)
        .roundedCornerWithBorder(lineWidth: 1, borderColor: .silver, radius: 8, corners: .allCorners)
        
    }
}
struct DoctorChoiceRowView_Previews: PreviewProvider {
    static var previews: some View {
        
        DoctorChoiceRowView(viewModel: DoctorViewModel(doctor: DoctorInfoModel(
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
            nearestReceptionTime: nil,
            isLiked: true)))
            .previewLayout(.sizeThatFits)
    }
}
