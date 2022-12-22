//
//  TaskView.swift
//  SwiftUIToDo
//
//  Created by sade on 12/21/22.
//

import SwiftUI

struct TaskView: View {
    var body: some View {
        NavigationView {
            List {
                Section (
                    header:
                        HStack {
                            Text("Tasks")
                       
                        }
                ){
                    Text("Content")
                }
            }
        }
        
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
