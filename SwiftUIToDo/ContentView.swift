//
//  ContentView.swift
//  SwiftUIToDo
//
//  Created by sade on 12/20/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                    Image(systemName:"house")
                    Text("home")
                }
            
            ToDoView()
                .tabItem {
                    Image(systemName: "list.clipboard")
                    Text("Grocery List")
            }
            TaskView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Tasks")
                }
            CalendarView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Calendar")
                }
            
            }
            
        }
       
    }
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
