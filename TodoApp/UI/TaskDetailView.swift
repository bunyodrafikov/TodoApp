//
//  TaskDetailView.swift
//  TodoApp
//
//  Created by Bunyod Rafikov on 2025-01-04.
//

import SwiftUI

struct TaskDetailView: View {
  let task: Task

  var body: some View {
    List {
      Section("Title") {
        Text(task.title)
      }
      Section("Description") {
        Text(task.description)
      }
      Section("Deadline") {
        Text(task.deadline.formatted(.dateTime.year().month().day().hour().minute()))
      }
    }
    .navigationTitle("Task Details")
  }
}

#Preview {
  TaskDetailView(
    task: Task(
      title: "My task title",
      description: "The task Description",
      deadline: Date()
    )
  )
}
