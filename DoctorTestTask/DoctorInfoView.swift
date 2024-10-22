//
//  DoctorInfoView.swift
//  DoctorTestTask
//
//  Created by Anastasia Gorbunova on 22.10.2024.
//

import SwiftUI

struct DoctorInfoView: View {
    @Environment(\.dismiss) var dismiss
    var doctorInfo: DoctorInfo
    var text: String = "Проводит диагностику и лечение терапевтических больных. Осуществляет расшифровку и снятие ЭКГ. Дает рекомендации по диетологии. Доктор имеет опыт работы в России и зарубежом. Проводит консультации пациентов на английском языке."


    var lines: [String] {
        text.components(separatedBy: .newlines)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .top) {
                Image(doctorInfo.avatar)
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .leading)
                    .clipShape(Circle())
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 8))
                
                VStack(alignment: .leading,  spacing: 0) {
                    Text("\(doctorInfo.surname)")
                        .font(.boldBodyFont)
                        .frame(height: 24)
                    Text("\(doctorInfo.name)")
                        .font(.boldBodyFont)
                        .frame(height: 24)
                }
                    
            }
            
            Spacer()
                .frame(height: 20)
            
            VStack(alignment: .leading,spacing: 10) {
                HStack( spacing: 4) {
                    Image("clock")
                        .foregroundStyle(Color.darkGray)
                        .frame(width: 24, height: 24)
                    Text("Опыт работы")
                        .foregroundStyle(Color.darkGray)
                        .font(.smallBodyFont)
                        .frame(width: 127, height: 24, alignment: .leading)
                }
                HStack( spacing: 4) {
                    Image("medicine")
                        .foregroundStyle(Color.darkGray)
                        .frame(width: 24, height: 24)
                    Text("Опыт работы")
                        .foregroundStyle(Color.darkGray)
                        .font(.smallBodyFont)
                        .frame(width: 127, height: 24, alignment: .leading)
                }
                HStack( spacing: 4) {
                    Image("cap")
                        .foregroundStyle(Color.darkGray)
                        .frame(width: 24, height: 24)
                    Text("Опыт работы")
                        .foregroundStyle(Color.darkGray)
                        .font(.smallBodyFont)
                        .frame(width: 127, height: 24, alignment: .leading)
                }
                HStack( spacing: 4) {
                    
                    Image("location")
                        .foregroundStyle(Color.darkGray)
                        .frame(width: 24, height: 24)
                    Text("Опыт работы")
                        .foregroundStyle(Color.darkGray)
                        .font(.smallBodyFont)
                        .frame(width: 127, height: 24, alignment: .leading)
                }
                
            }
            Spacer()
                .frame(height: 20)
            HStack {
                Text("Стоимость услуг")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.boldBodyFont)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                Text("от 600Р")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .font(.boldBodyFont)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16))
            }

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
                for family in UIFont.familyNames.sorted() {
                    let names = UIFont.fontNames(forFamilyName: family)
                    print("Family: \(family) Font names: \(names)")
                }
            }) {
                Text("Записаться")
                    .frame(height: 24)
                    .font(.boldBodyFont)
                    //.fontWeight(selectedSortOption == .rating ? .bold : .regular)
                    .foregroundColor(.white )
                    //.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
                    .frame(maxWidth: .infinity)
                    
            }
            .frame(height: 56)
            .background(.coral)
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

#Preview {
    DoctorInfoView(doctorInfo: doctorsData[1])
}
