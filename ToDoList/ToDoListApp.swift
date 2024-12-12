//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Ildar Garifullin on 05.12.2024.
//

import SwiftUI

/*
 MVVM
 Model - data point / точка данных
 View - UI
 ViewModel - manages Models for View / управление моделями для представления
 */

@main
struct ToDoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListIView()
            }
            // исправить .navigationViewStyle
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
