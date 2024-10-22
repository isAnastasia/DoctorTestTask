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

            DoctorsListView()
            
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
