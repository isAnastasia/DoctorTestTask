//
//  DoctorChoiceRowView.swift
//  DoctorTestTask
//
//  Created by Anastasia Gorbunova on 18.10.2024.
//

import SwiftUI

struct DoctorChoiceRowView: View {
    
    var doctorInfo: DoctorInfo
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image(doctorInfo.avatar)
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .leading)
                    .clipShape(Circle())
                    
                
                    
                VStack(alignment: .leading, spacing: 8) {
                    VStack(alignment: .leading,  spacing: 0) {
                        Text("\(doctorInfo.surname)")
                            .font(.system(size: 16, weight: .bold))
                            .frame(height: 24)
                        Text("\(doctorInfo.name)")
                            .font(.system(size: 16, weight: .bold))
                            .frame(height: 24)
                    }
                    
                    HStack(spacing: 2.4) {
                        ForEach(0..<doctorInfo.rating) {_ in
                            Image(systemName: "star.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundStyle(.pink)
                        }
                        ForEach(0..<5 - doctorInfo.rating) {_ in
                            Image(systemName: "star.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundStyle(.gray)
                        }
                        
                    }
                    .frame(width: 69.6, height: 12)
                    Text("\(doctorInfo.specialization) * Стаж \(doctorInfo.workExpirience) лет")
                        .font(.system(size: 14))
                        .foregroundStyle(.gray)
                    Text("От \(doctorInfo.price) Р")
                        .font(.system(size: 16, weight: .bold))
                }
                .frame(maxWidth: .infinity, minHeight: 126, alignment: .topLeading)

                Image(systemName: "heart")
                    .resizable()
                    .padding(EdgeInsets(top: 4, leading: 0, bottom: 0, trailing: 2))
                    .frame(width: 24, height: 24, alignment: .topTrailing)
                    .foregroundStyle(.gray)
            }
            .frame(maxWidth: .infinity)
            
            Button(action: {}) {
                Text("Записаться")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(.white)
            }
            .buttonStyle(.plain)
            .frame(maxWidth: .infinity, minHeight: 47)
            .background(.pink)
            .cornerRadius(8)
            
        }.containerRelativeFrame(.horizontal, alignment: .center) { length, axis in
            return length - 32
            //return 321
        
            
        }
        
    }
}
struct DoctorChoiceRowView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorChoiceRowView(doctorInfo: doctorsData[1])
            .previewLayout(.sizeThatFits)
    }
}
