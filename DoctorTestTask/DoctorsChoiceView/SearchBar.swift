//
//  SearchBar.swift
//  DoctorTestTask
//
//  Created by Anastasia Gorbunova on 22.10.2024.
//

import SwiftUI

struct SearchBar: View {
    @State var searchText = ""
    //@Binding var searchTextBinding: String
    var hasCancel: Bool = true
    @State private var fgColor = Color.red
    var action: ()->()
    var onCancel: ()->()
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                //RoundedRectangle(cornerRadius: 8)
                    .frame(height: 36)
                    //.cornerRadius(12)
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
                    //.textFieldStyle(.plain)
                    .foregroundStyle(Color.darkGray)
                    //.cornerRadius(12)
                }

            }
            .containerRelativeFrame(.horizontal, alignment: .center) { length, axis in
                return length - 32
                
            }
//            if hasCancel {
//                Button(action: {
//                    searchText = ""
//                    onCancel()
//                }) {
//                    Text("Cancel")
//                        .foregroundColor(.gray)
//                        .font(.system(size: 16))
//                }
//                .padding(.trailing, 8)
//                .transition(.move(edge: .trailing))
//                .animation(.easeInOut(duration: 1.0), value: UUID())
//            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(action: {}, onCancel: {})
    }
}
//#Preview {
//    SearchBar()
//}
