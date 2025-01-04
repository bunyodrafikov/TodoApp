//
//  TaskItem.swift
//  TodoApp
//
//  Created by Bunyod Rafikov on 2025-01-04.
//

import SwiftUI

struct TaskItem: View {
  let task: Task
  var onToggleTaskCompletion: (Task) -> Void

  var body: some View {
    HStack {
      Button(action: { onToggleTaskCompletion(task) }) {
        Image(
          systemName: task.isCompleted ? "checkmark.circle.fill" : "circle"
        ).foregroundColor(task.isCompleted ? .green : .gray)
      }
      .buttonStyle(BorderlessButtonStyle())
      
      NavigationLink(destination: TaskDetailView(task: task)) {
        Text(task.title)
          .strikethrough(task.isCompleted, color: .gray)
          .foregroundColor(task.isCompleted ? .gray : (task.deadline < Date() ? .red : .primary))
      }
    }
  }
}

#Preview {
  TaskItem(
    task: Task(
      title: "My task title",
      description: "",
      deadline: Date() + 1000000,
      isCompleted: false
    ),
    onToggleTaskCompletion: { _ in }
  )
}

