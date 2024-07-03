//
//  ContentView.swift
//  FocusApp
//
//  Created by Siddhant Borkar on 7/1/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab){
            
            ToDoView()
                .tabItem {
                    VStack{
                        Image(systemName: selectedTab == 1 ? "paperclip.circle.fill" : "paperclip.circle")
                            .environment(\.symbolVariants, selectedTab == 1 ? .fill : .none)
                        Text("tasks")
                    }
                }
                .onAppear { selectedTab = 1 }
                .tag(1)
                
            
            TimerView()
                .tabItem {
                    VStack{
                        Image(systemName: selectedTab == 2 ? "timer.circle.fill" : "timer.circle")
                            .environment(\.symbolVariants, selectedTab == 2 ? .fill : .none)
                        Text("timer")
                    }
                }
                .onAppear { selectedTab = 2 }
                .tag(2)
            
        }
        .tint(.black)
    }
}

#Preview {
    ContentView()
}
