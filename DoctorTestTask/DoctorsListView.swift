//
//  DoctorsListView.swift
//  DoctorTestTask
//
//  Created by Anastasia Gorbunova on 22.10.2024.
//

import SwiftUI

struct DoctorsListView: View {
    @State private var searchText = ""
    var body: some View {
        NavigationStack {
            VStack() {
                SearchBar(action: {}, onCancel: {})
                Spacer()
                    .frame(height: 16)
                
                FiltersButtonRowView()
                    .frame(height: 32)
                Spacer()
                    .frame(height: 24)
                ScrollView (.vertical) {
                    LazyVStack(spacing: 16) {

                        ForEach(doctorsData) { doctor in
                            NavigationLink(destination: DoctorInfoView(doctorInfo: doctor)) {
                                DoctorChoiceRowView(doctorInfo: doctor)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
                    
            }
            //.background(.red)
            
            .ignoresSafeArea()
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 16))
            .background(.lightGray)
            .navigationTitle("Педиатры")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.gray, for: .navigationBar)
            //.toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "chevron.backward").foregroundStyle(Color.gray)
                }
            }
            
        }
        
        //.navigationTitle("Педиатры")
//        .searchable(text: $searchText) {
//            
//        }
        //.padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
//        .searchable(text: $searchText) {
//            
//        }
        
    }
}

#Preview {
    DoctorsListView()
}
