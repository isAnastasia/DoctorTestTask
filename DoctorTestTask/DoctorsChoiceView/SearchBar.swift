//
//  SearchBar.swift
//  DoctorTestTask
//
//  Created by Anastasia Gorbunova on 22.10.2024.
//

import SwiftUI

struct SearchBar: View {
    @State var searchText = ""
    var hasCancel: Bool = true
    @State private var fgColor = Color.red
    var action: ()->()
    var onCancel: ()->()
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .frame(height: 36)
                    .foregroundColor(.white)
                    .roundedCornerWithBorder(lineWidth: 1, borderColor: .silver, radius: 8, corners: .allCorners)
                HStack {
                    Spacer()
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.silver)
                    
                    TextField("", text: $searchText, prompt: Text("Поиск").foregroundColor(.silver))
                    .onChange(of: searchText) {
                        action()
                    }
                    .font(.system(size: 16))
                    .frame(height: 36)
                    .foregroundStyle(Color.darkGray)
                }

            }
            .containerRelativeFrame(.horizontal, alignment: .center) { length, axis in
                return length - 32
                
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(action: {}, onCancel: {})
    }
}
