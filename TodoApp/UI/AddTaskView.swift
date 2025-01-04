//
//  AddTaskView.swift
//  TodoApp
//
//  Created by Bunyod Rafikov on 2025-01-04.
//

import SwiftUI

struct AddTaskView: View {
  @ObservedObject var viewModel: MainViewModel
  @Binding var isPresented: Bool

  @State private var title = ""
  @State private var description = ""
  @State private var deadline = Date() + 86400 // 86400 seconds == one day

  var body: some View {
    NavigationView {
      Form {
        TextField("Title", text: $title)
        TextField("Description", text: $description)
        DatePicker("Deadline", selection: $deadline, displayedComponents: .date)
      }
      .navigationTitle("Add Task")
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button("Cancel") {
            isPresented = false
          }
        }
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("Save") {
            viewModel.addTask(title: title, description: description, deadline: deadline)
            isPresented = false
          }
        }
      }
    }
  }
}


#Preview {
  let isPresented = Binding(get: { true }) { _ in }
  return AddTaskView(
    viewModel: MainViewModel(), 
    isPresented: isPresented
  )
}
