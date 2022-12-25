//
//  CoreDataBootcamp.swift
//  SwiftUIToDo
//
//  Created by sade on 12/23/22.
//

import SwiftUI
import CoreData

class CoreDataViewModel: ObservableObject {
    let container: NSPersistentContainer
    @Published var savedEntities: [TaskEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "TaskContainer")
        container.loadPersistentStores { (description, error)  in
            if let error = error {
                print("Error loading core data. \(error)")
            }
            
        }
        fetchTasks()
    }
    func fetchTasks() {
        let request = NSFetchRequest<TaskEntity>(entityName: "TaskEntity")
        do {
            savedEntities = try container.viewContext.fetch(request)
            
            }
        catch let error {
            print("Error fetching \(error)")
        }
       
    }
    func addTask(text: String) {
        let newTask = TaskEntity(context: container.viewContext)
        newTask.name = text
        saveTask()
    }
    
    func deleteTask(indexSet: IndexSet)
    {
        guard let index = indexSet.first else { return }
        let entity = savedEntities[index]
        container.viewContext.delete(entity)
        saveTask()
    }
    func updateTask(entity: TaskEntity)
    {
        let currentName = entity.name ?? ""
        let newName = currentName + "!"
        entity.name = newName
        saveTask()
    }
    
    func saveTask() {
        do {
            try container.viewContext.save()
            fetchTasks()
        } catch let error {
            print("Error saving. \(error)")
        }
    }
}


struct CoreDataBootcamp: View {
    
    @State var vm = CoreDataViewModel()
    
    //state vars must always remain within view struct
    @State var textEditor: String = ""
    //variable to save 'saved' data
//    @State var savedText: String =  "TaskContainer"
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Add Item:")
                    .fontWeight(.bold)
                    .font(Font.custom("American Typewriter", size: 20))
                //placeholder value
                TextField("Type task here...", text: $textEditor)
                    .frame(height: 40)
                    .frame(width: 350)
                    .cornerRadius(10)
                    
                //create button that allows user to save task
                Button(action: {
                    guard !textEditor.isEmpty else {return}
                    vm.addTask(text: textEditor)
                    textEditor = ""
                    
                }, label: {
                    Text("Save")
                        .foregroundColor(Color(.purple))
                        .padding(10)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(Color(.black))
                        .cornerRadius(10)
                        .fontWeight(.bold)
                        .font(Font.custom("American Typewriter", size: 35))
                    
                })
                .padding(.horizontal)
                List {
                    ForEach(vm.savedEntities) {
                        entity in Text(entity.name ?? "no name")
                            .onTapGesture {
                                vm.updateTask(entity: entity)
                            }
                    }
                    .onDelete(perform: vm.deleteTask)
                }
                .listStyle(PlainListStyle())
                    
                }
            .padding()
                .background(
                    LinearGradient(colors: [.purple, .blue], startPoint: .top, endPoint: .bottom))
            }
      
        }    }

struct CoreDataBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataBootcamp()
       
    }
}
