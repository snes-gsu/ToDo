//
//  AddView.swift
//  SwiftUIToDo
//
//  Created by sade on 12/22/22.
//

import SwiftUI




struct AddView: View {
    //state vars must always remain within view struct
    @State var textEditor: String = "Type here..."
    //variable to save 'saved' data
    @State var savedText: String =  "TaskContainer"

    var body: some View {
        
        NavigationView {
            VStack {
                Text("Add Item:")
                    .fontWeight(.bold)
                    .font(Font.custom("American Typewriter", size: 20))
                //placeholder value
                TextEditor(text: $textEditor)
                    .frame(height: 40)
                    .frame(width: 350)
                    .cornerRadius(10)
                    
                //create button that allows user to save task
                Button(action: {
                    savedText = textEditor
                    
                }, label: {
                    Text("Save")
                        .foregroundColor(Color(.purple))
                        .padding(10)
                        .frame(maxWidth: 300)
                        .background(Color(.black))
                        .cornerRadius(10)
                        .fontWeight(.bold)
                        .font(Font.custom("American Typewriter", size: 35))
                    
                })
              Spacer()
                    
                }
            .padding()
                .background(
                    LinearGradient(colors: [.purple, .blue], startPoint: .top, endPoint: .bottom))
                
          

                
            }
      
        }    }


struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
