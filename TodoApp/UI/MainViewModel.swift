//
//  MainViewModel.swift
//  TodoApp
//
//  Created by Bunyod Rafikov on 2025-01-04.
//

import Foundation

final class MainViewModel: ObservableObject {
  @Published var tasks: [Task] = []

  private let tasksKey = "TasksKey"

  init() {
    loadTasks()
  }

  func addTask(title: String, description: String, deadline: Date) {
    let newTask = Task(title: title, description: description, deadline: deadline)
    tasks.append(newTask)
    saveTasks()
  }

  func toggleTaskCompletion(_ task: Task) {
    if let index = tasks.firstIndex(where: { $0.id == task.id }) {
      tasks[index].isCompleted.toggle()
      saveTasks()
    }
  }

  private func saveTasks() {
    if let data = try? JSONEncoder().encode(tasks) {
      UserDefaults.standard.set(data, forKey: tasksKey)
    }
  }

  private func loadTasks() {
    if let data = UserDefaults.standard.data(forKey: tasksKey),
       let savedTasks = try? JSONDecoder().decode([Task].self, from: data) {
      tasks = savedTasks
    }
  }
}

