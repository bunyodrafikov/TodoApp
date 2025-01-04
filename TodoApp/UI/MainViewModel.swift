//
//  MainViewModel.swift
//  TodoApp
//
//  Created by Bunyod Rafikov on 2025-01-04.
//

import Foundation

final class MainViewModel: ObservableObject {
  @Published var tasks: [String] = [""]
}
