//
//  AddTodoView.swift
//  TodoApp
//
//  Created by 양원식 on 2024/03/27.
//

import SwiftUI

struct AddTodoView: View {
    // MARK: - PROPERTY
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name: String = ""
    @State private var priority: String = "Normal"
    
    let priorities = ["High", "Normal", "Low"]
    
    // MARK: - FUNCTION
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    // MARK: - TODO NAME
                    TextField("Todo", text: $name)
                    
                    // MARK: - TODO PRIORITY
                    Picker("Priority", selection: $priority, content: {
                        ForEach(priorities, id: \.self, content: {
                            Text($0)
                        })
                    })
                    .pickerStyle(SegmentedPickerStyle())
                    
                    // MARK: - SAVE BUTTON
                    Button(action: {
                        print("Save a new todo item.")
                    }, label: {
                        Text("Save")
                    }) //: SAVE BUTTON
                } //: FORM
                
                Spacer()
                
            } //: VSTACK
            .navigationBarTitle("New Todo",displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark")
            })
            )
        } //: NAVIGATION
    }
}

// MARK: - PREVIEW

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView()
    }
}