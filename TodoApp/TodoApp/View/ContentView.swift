//
//  ContentView.swift
//  TodoApp
//
//  Created by 양원식 on 2024/03/27.
//

import SwiftUI
import CoreData

struct ContentView: View {
    // MARK: - PROPERTY
    
    @State private var showingAddTodoView: Bool = false
    // MARK: - FUNCTION
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView(content: {
            List(0 ..< 5) { item in
                Text("Hello, World!")
            } //: LIST
            .listStyle(.plain)
            .navigationBarTitle("Todo", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                self.showingAddTodoView.toggle()
            }, label: {
                Image(systemName: "plus")
            })
                    .sheet(isPresented: $showingAddTodoView, content: {
                        AddTodoView()
                    })
            )
        }) //: NAVIGATION
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
