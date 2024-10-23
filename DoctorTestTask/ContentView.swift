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
                Image("House")
                Text("Главная")
            }
            
            Text("Second View")
            .tabItem {
                Image("Calendar")
                Text("Приёмы")
            }

            Text("Third View")
            .tabItem {
                Image("Chat")
                Text("Чат")
            }
            
            Text("Forth View")
            .tabItem {
                Image("Person")
                Text("Профиль")
            }
            
        }.accentColor(.pink)
    }
}

#Preview {
    ContentView()
}
