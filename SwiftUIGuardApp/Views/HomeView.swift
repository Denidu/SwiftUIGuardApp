//
//  HomeView.swift
//  SwiftUIGuardApp
//
//  Created by Denidu Gamage on 2025-05-21.
//

import SwiftUI

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Welcome to GuardApp")
                    .font(.largeTitle)
                    .bold()

                Image(systemName: "faceid")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
            }
            .padding()
        }
    }
}


#Preview {
    HomeView()
}
