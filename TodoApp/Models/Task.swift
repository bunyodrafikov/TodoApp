//
//  Task.swift
//  TodoApp
//
//  Created by Bunyod Rafikov on 2025-01-04.
//

import Foundation

struct Task: Identifiable, Codable, Hashable {
  var id: UUID = UUID()
  var title: String
  var description: String
  var deadline: Date
  var isCompleted: Bool = false
}
