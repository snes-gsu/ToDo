//
//  ToDoView.swift
//  SwiftUIToDo
//
//  Created by sade on 12/20/22.
//

import SwiftUI

struct ToDoView: View {
    
    @State var veggies: [String] = ["brussel sprouts", "collards", "kale", "broccoli"]
    
    @State var fruits: [String] = ["Rombatan", "StarFruit", "DragonFruit"]
    
    @State var meatDairy: [String] = ["Beef", "Chicken", "Milk"]
    
    var body: some View {
        NavigationView {
            List {
                Section (
                    
                    header:
                        HStack {
                            Text("FRUITS")
                        Image(systemName: "apple.logo")
                        }
                ) {
                        ForEach(fruits, id: \.self) { fruit in
                            Text(fruit.capitalized)
                        }
                        //perform gets the functions working
                        .onDelete(perform: delete)
                        .onMove(perform: move)
                    }
                Section (
                    header:
                    HStack {
                        Text("VEGGIES")
                    Image(systemName: "carrot.fill")
                    }
                
                ) {
                        ForEach(veggies, id: \.self) {
                            veggies in Text(veggies.capitalized)
                        }
                        .onDelete(perform: delete)
                        .onMove(perform: move)
                    }
                Section (
                    header:
                    HStack {
                        Text("MEAT/DAIRY")
                    Image(systemName: "fork.knife")
                    }
                
                ) {
                        ForEach(meatDairy, id: \.self) {
                            meat in Text(meat.capitalized)
                        }
                        .onDelete(perform: delete)
                        .onMove(perform: move)
                    }
            }
            //.listStyle(GroupedListStyle())
            .navigationTitle("Grocery List")
            .navigationBarItems(leading: EditButton(), trailing: addButton)
        }
        
        .accentColor(.purple)
        }
    var addButton: some View {
        Button("+", action: {
            add()
        })
    }
    
    func delete(indexSet: IndexSet) {
        fruits.remove(atOffsets: indexSet)
        veggies.remove(atOffsets: indexSet)
        meatDairy.remove(atOffsets: indexSet)
         
        }
    func move(indices: IndexSet, newOffset: Int) {
        fruits.move(fromOffsets: indices, toOffset: newOffset)
        veggies.move(fromOffsets: indices, toOffset: newOffset)
        meatDairy.move(fromOffsets: indices, toOffset: newOffset)

        
    }
    func add()
    {
        fruits.append("Soursop")
    }
        }


struct ToDoView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView()
    }
}
