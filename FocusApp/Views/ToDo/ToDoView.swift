//
//  ToDoView.swift
//  FocusApp
//
//  Created by Siddhant Borkar on 7/1/24.
//

import SwiftUI

struct ToDoView: View {
    @State private var task: String = ""
    @State private var tasks: [String] = []
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Enter your task...", text: $task)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.horizontal)
                    
                    Button(action: {
                        if !task.isEmpty {
                            tasks.append(task)
                            task = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.blue)
                            .padding(.trailing)
                    }
                }
                .padding(.top)
                
            
                List {
                    ForEach(tasks, id: \.self) { task in
                        HStack {
                            Button(action: {
                                
                            }) {
                                Image(systemName: "checkmark.circle")
                                    .foregroundColor(.green)
                            }
                            Text(task)
                        }
                    }
                    
                }
                .cornerRadius(8)
                .padding(.horizontal)
                
                Spacer()
            }
            .navigationTitle("Tasks")
            .background(
                RadialGradient(
                    gradient: Gradient(colors: [Color("Red"), Color("Salmon")]),
                    center: .center,
                    startRadius: 5,
                    endRadius: 500
                )
            )
        }
    }
}
/*
struct ToDoView: View {
    @State private var task: String = ""
    var body: some View {
        NavigationStack{
            VStack{
                TextField("Enter a task", text: $task)
            }
            .navigationTitle("Tasks and Goals")
        }
        
    }
}
*/
#Preview {
    ToDoView()
}
