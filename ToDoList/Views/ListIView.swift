//
//  ListIView.swift
//  ToDoList
//
//  Created by Ildar Garifullin on 10.12.2024.
//

import SwiftUI

/*
 CRUD FUNCTIONS
 
 Create (функция добавления элементов - функция создания новых элементов)
 
 Read (функция получения элементов - функция чтение элементов)
 
 Update (функция обновления элементов - функция переключения элементов)
 
 Delete (функция удаления элемента - функция удаления элемента свайпом)
 */

struct ListIView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        List {
            ForEach(listViewModel.items) { item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.linear) {
                            listViewModel.updateItem(item: item)
                        }
                    }
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("ToDo List ✍🏻")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add") {
                    AddView()
                }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ListIView()
        }
        .environmentObject(ListViewModel())
    }
}
