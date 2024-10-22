//
//  ContentView.swift
//  DoctorTestTask
//
//  Created by Anastasia Gorbunova on 18.10.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    var body: some View {
        TabView {

            NavigationStack {
                FiltersButtonRowView()
                    .frame(height: 32)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))


                List(doctorsData) { doctor in
                    Section {
                        DoctorChoiceRowView(doctorInfo: doctor)
                    }
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets(top: 20, leading: 16, bottom: 16, trailing: 16))

                }
                .listSectionSpacing(16)
                .navigationTitle("Педиатры")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Image(systemName: "chevron.backward")
                    }
                }
 
            }
            .searchable(text: $searchText) {
                
            }
            .tabItem {
                Label("Главная", systemImage: "house.fill")
            }
            Text("Second View")
            .tabItem {
                Label("Приёмы", systemImage: "calendar")
            }

            Text("Third View")
            .tabItem {
                Label("Чат", systemImage: "message.fill")
            }
            
            Text("Forth View")
            .tabItem {
                Label("Профиль", systemImage: "person.fill")
            }
            
        }.accentColor(.pink)
    }
}

#Preview {
    ContentView()
}
