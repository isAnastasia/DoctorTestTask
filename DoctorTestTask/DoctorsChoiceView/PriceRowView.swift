//
//  PriceRowView.swift
//  DoctorTestTask
//
//  Created by Anastasia Gorbunova on 24.10.2024.
//

import SwiftUI

struct PriceRowView: View {
    var viewModel: PriceViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(viewModel.name)
                .frame(height: 24, alignment: .leading)
                .font(.boldBodyFont)
            HStack {
                Text(viewModel.tag)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.bodyFont)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                Text(viewModel.getPrice())
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .font(.bodyFont)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16))
            }
            .frame(height: 60)
            .containerRelativeFrame(.horizontal, alignment: .center) { length, axis in
                return length - 32
                
            }
            .background(Color.white)
            .roundedCornerWithBorder(lineWidth: 1, borderColor: .silver, radius: 8, corners: [.allCorners])
        }
    }
}

#Preview {
    PriceRowView(viewModel: PriceViewModel(price: 300, tag: "30 мин", name: "Видеоконсультация"))
}
