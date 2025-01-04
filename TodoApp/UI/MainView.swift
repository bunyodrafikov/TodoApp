//
//  ContentView.swift
//  TodoApp
//
//  Created by Bunyod Rafikov on 2025-01-04.
//

import SwiftUI

struct MainView: View {
  @StateObject var viewModel: MainViewModel = MainViewModel()

  var body: some View {
    VStack {
      List {
        ForEach(viewModel.tasks, id: \.self) { task in
          Text(task)
        }
      }
    }
    .padding()
  }
}

#Preview {
  MainView()
}
