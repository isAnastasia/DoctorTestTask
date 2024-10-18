//
//  ContentView.swift
//  DoctorTestTask
//
//  Created by Anastasia Gorbunova on 18.10.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List(doctorsData) { doctor in
            DoctorChoiceRowView(doctorInfo: doctor)
        }
        
    }
}

#Preview {
    ContentView()
}
