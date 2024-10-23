//
//  DoctorsListView.swift
//  DoctorTestTask
//
//  Created by Anastasia Gorbunova on 22.10.2024.
//

import SwiftUI

struct DoctorsListView: View {
    @State private var searchText = ""
    @ObservedObject var viewModel = DoctorsViewModel()
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

                        ForEach(viewModel.doctors) { doctor in
                            NavigationLink(destination: DoctorDetailView(viewModel: DoctorViewModel(doctor: doctor))) {
                                DoctorChoiceRowView(viewModel: DoctorViewModel(doctor: doctor))
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
                    
            }
            
            .ignoresSafeArea()
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 16))
            .background(.lightGray)
            .navigationTitle("Педиатры")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.gray, for: .navigationBar)

            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "chevron.backward").foregroundStyle(Color.gray)
                }
            }
            
        }
        .onAppear {
            viewModel.loadUsers()
        }
        
    }
}

#Preview {
    DoctorsListView()
}
