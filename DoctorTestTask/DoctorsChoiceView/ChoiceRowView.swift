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
                    .padding(EdgeInsets(top: 20, leading: 16, bottom: 8, trailing: 8))
                    
                
                    
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
                                .foregroundStyle(.coral)
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
                        .foregroundStyle(.darkGray)
                    Text("От \(doctorInfo.price) Р")
                        .font(.system(size: 16, weight: .bold))
                }
                .frame(maxWidth: .infinity, minHeight: 126, alignment: .topLeading)
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))

                Image(systemName: "heart")
                    .resizable()
                    .frame(width: 20, height: 17.16, alignment: .topTrailing)
                    .padding(EdgeInsets(top: 24, leading: 0, bottom: 0, trailing: 18))
                    
                    .foregroundStyle(.gray)
            }
            .frame(maxWidth: .infinity)
            
            
            Button(action: {}) {
                Text("Записаться")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(.white)
            }
            .buttonStyle(.plain)
            .frame( minHeight: 47)
            .containerRelativeFrame(.horizontal, alignment: .center) { length, axis in
                return length - 32
                
            }
            
            .background(.coral)
            .cornerRadius(8)
            
            
            
        }
        .containerRelativeFrame(.horizontal, alignment: .center) { length, axis in
            //return length
            //return 321
            return 353
        
            
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
        .background(Color.white)
        .roundedCornerWithBorder(lineWidth: 1, borderColor: .silver, radius: 8, corners: .allCorners)
        
    }
}
struct DoctorChoiceRowView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorChoiceRowView(doctorInfo: doctorsData[1])
            .previewLayout(.sizeThatFits)
    }
}
