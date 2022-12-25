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
                    Image(systemName: "list.dash")
                    Text("Tasks")
                }
            CalendarView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Calendar")
                }
        }
        
        Spacer()
            .frame(height: 30)
            .frame(maxWidth: .infinity)
            .foregroundColor(.black)
            .background(
                LinearGradient(colors: [.purple, .blue], startPoint: .top, endPoint: .bottom))
        
        
    }
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
