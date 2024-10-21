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
                    .font(.system(size: 14))
                    .fontWeight(selectedSortOption == .price ? .bold : .regular)
                    .foregroundColor(selectedSortOption == .price ? .white : .gray)
                    //.padding()
                    .frame(maxWidth: .infinity)
                    .background(selectedSortOption == .price ? Color.pink : Color.white)
                    //.cornerRadius(8)
                    .frame( height: 32)
            }
            //Divider().frame(maxWidth: 1, maxHeight: 32).overlay(Color.black)
            Button(action: {
                selectedSortOption = .experience
            }) {
                Text("По стажу")
                    .font(.system(size: 14))
                    .fontWeight(selectedSortOption == .experience ? .bold : .regular)
                    .foregroundColor(selectedSortOption == .experience ? .white : .gray)
                    //.padding()
                    .frame(maxWidth: .infinity)
                    .background(selectedSortOption == .experience ? Color.pink : Color.green)
                    //.cornerRadius(8)
                    .frame( height: 32)
            }
            //Divider().frame(maxWidth: 1, maxHeight: 32).background(Color.black)
            Button(action: {
                selectedSortOption = .rating
            }) {
                Text("По рейтингу")
                    .font(.system(size: 14))
                    .fontWeight(selectedSortOption == .rating ? .bold : .regular)
                    .foregroundColor(selectedSortOption == .rating ? .white : .gray)
                    //.padding()
                    .frame(maxWidth: .infinity)
                    .background(selectedSortOption == .rating ? Color.pink : Color.white)
                    //.cornerRadius(8)
                    .frame( height: 32)
            }
        }
        //.frame(maxHeight: 32)
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
