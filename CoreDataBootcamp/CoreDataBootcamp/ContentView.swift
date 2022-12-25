//
//  ContentView.swift
//  CoreDataBootcamp
//
//  Created by sade on 12/23/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: ProfileEntity.entity(),
                  sortDescriptors: [NSSortDescriptor(keyPath: \ProfileEntity.name, ascending: true)])
    var profiles: FetchedResults<ProfileEntity>
    
    @State var textFieldText: String = ""
    
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20)
            {
                TextField("Add name here...", text: $textFieldText)
                    .font(.headline)
                    .padding(.leading)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(Color(.white))
                    .cornerRadius(20)
                    .padding(.horizontal)
                
                Button(action: {
                    addItem()
                }, label: {
                    Text("Submit")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(Color(.blue))
                        .cornerRadius(20)
                })
                .padding(.horizontal)
                
                List {
                    ForEach(profiles) { profile in
                        Text(profile.name ?? "")
                            .onTapGesture {
                                updateItem(profile: profile)
                            }
                    }
                    .onDelete(perform: deleteItems)
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Profiles")
            }
        }
    }

    private func addItem() {
        withAnimation {
let newProfile = ProfileEntity(context: viewContext)
newProfile.name = textFieldText
            
saveItems()
            textFieldText = ""
        }
    }
    
    private func updateItem(profile: ProfileEntity)
    {
        withAnimation {
            let currentName = profile.name ?? ""
            let newName = currentName + "!"
            profile.name = newName
            saveItems()
       
        }
        
    }
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            guard let index = offsets.first else { return }
            let profileEntity = profiles[index]
            viewContext.delete(profileEntity)
//            offsets.map { items[$0] }.forEach(viewContext.delete)
            saveItems()
            textFieldText = ""
           
        }
    }
    private func saveItems() {
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
