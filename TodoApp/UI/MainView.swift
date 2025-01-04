//
//  ContentView.swift
//  TodoApp
//
//  Created by Bunyod Rafikov on 2025-01-04.
//

import SwiftUI

struct MainView: View {
  @StateObject private var viewModel = MainViewModel()
  @State private var isAddingTask = false

  var body: some View {
    NavigationView {
      List {
        ForEach(viewModel.tasks) { task in
          TaskItem(task: task, onToggleTaskCompletion: viewModel.toggleTaskCompletion(_:))
        }
      }
      .navigationTitle("Tasks")
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button(action: { isAddingTask = true }) {
            Image(systemName: "plus")
          }
        }
      }
      .sheet(isPresented: $isAddingTask) {
        AddTaskView(viewModel: viewModel, isPresented: $isAddingTask)
      }
    }
  }
}


#Preview {
  MainView()
}
