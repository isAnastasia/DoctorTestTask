//
//  FiltersButtonRowView.swift
//  DoctorTestTask
//
//  Created by Anastasia Gorbunova on 20.10.2024.
//

import SwiftUI

struct FiltersButtonRowView: View {
    
    @State private var selectedSortOption: SortOption = .price
        
    enum SortOption {
        case price, experience, rating
    }
    var body: some View {
        HStack(spacing: 0) {
            Button(action: {
                selectedSortOption = .price
            }) {
                Text("По цене")
                    .frame(height: 32)
                    .font(.system(size: 14))
                    .fontWeight(selectedSortOption == .price ? .bold : .regular)
                    .foregroundColor(selectedSortOption == .price ? .white : .gray)
                    .frame(maxWidth: .infinity)
                    .background(selectedSortOption == .price ? .coral : Color.white)

            }
            .roundedCornerWithBorder(lineWidth: 0.5, borderColor: .gray, radius: 8, corners: [.topLeft, .bottomLeft])

            
            Button(action: {
                selectedSortOption = .experience
            }) {
                Text("По стажу")
                    .frame(height: 32)
                    .font(.system(size: 14))
                    .fontWeight(selectedSortOption == .experience ? .bold : .regular)
                    .foregroundColor(selectedSortOption == .experience ? .white : .gray)

                    .frame(maxWidth: .infinity)
                    .background(selectedSortOption == .experience ? .coral : Color.white)

                    .overlay(
                        Rectangle().stroke( Color.gray, lineWidth: 0.5)
                    )

            }


            Button(action: {
                selectedSortOption = .rating
            }) {
                Text("По рейтингу")
                    .frame(height: 32)
                    .font(.system(size: 14))
                    .fontWeight(selectedSortOption == .rating ? .bold : .regular)
                    .foregroundColor(selectedSortOption == .rating ? .white : .gray)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
                    .frame(maxWidth: .infinity)
                    .background(selectedSortOption == .rating ? .coral : Color.white)
            }
            
            .roundedCornerWithBorder(lineWidth: 0.5, borderColor: .gray, radius: 8, corners: [.topRight, .bottomRight])

        }
    }
}

struct RoundedCorner: Shape {
    let radius: CGFloat
    let corners: UIRectCorner

    init(radius: CGFloat = .infinity, corners: UIRectCorner = .allCorners) {
        self.radius = radius
        self.corners = corners
    }

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
    func roundedCornerWithBorder(lineWidth: CGFloat, borderColor: Color, radius: CGFloat, corners: UIRectCorner) -> some View {
            clipShape(RoundedCorner(radius: radius, corners: corners) )
                .overlay(RoundedCorner(radius: radius, corners: corners)
                    .stroke(borderColor, lineWidth: lineWidth))
        }
}

struct FiltersButtonRowView_Previews: PreviewProvider {
    static var previews: some View {
        FiltersButtonRowView()
            //.previewLayout(.sizeThatFits)
    }
}
//#Preview {
//    
//}
