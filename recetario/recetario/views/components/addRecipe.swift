//
//  addRecipe.swift
//  recetario
//
//  Created by user246311 on 10/6/23.
//

import SwiftUI
@MainActor
final class addRecipesViewModel: ObservableObject{
    
    func addRecipe(recipe: Recipe) async throws {
        try await RecipeManager.shared.uploadRecipe(recipe: recipe)
    }
    
    func date()  -> String {
        let currDate = Date()
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd"
        let datePublished = dateFormat.string(from: currDate)
        return datePublished
    }
    
}

struct AddRecipe: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.red]
    }
    
    @State private var name: String = ""
    @State private var imageURL: String = ""
    @State private var ingredients: String = ""
    @State private var instructions: String = ""
    @State private var portions: String = ""
    @State private var tiempo: String = ""
    @State private var description: String = ""
    @State private var navRecipe = false
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject private var addVM = addRecipesViewModel()
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Nombre")){
                    TextField("Nombre de la receta", text: $name)
                }
                Section(header: Text("Imagen")){
                    TextField("URL de la imagen", text: $imageURL)
                }
                Section(header: Text("Ingredientes")){
                    TextEditor(text: $ingredients)
                }
                Section(header: Text("Instrucciones")){
                    TextEditor(text: $instructions)
                }
                Section(header: Text("Descripcion")){
                    TextField("Descripcion", text: $description)
                }
                Section(header: Text("Tiempo")){
                    TextField("Tiempo en minutos", text: $tiempo)
                }
                Section(header: Text("Porciones")){
                    TextField("Cantidad de personas", text: $portions)
                }

            }
            .toolbar(content: {
                ToolbarItem{
                    NavigationLink(isActive: $navRecipe){
                        MenuView()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Button{action: do {
                            Task{
                                let date = addVM.date()
                                try? await addVM.addRecipe(recipe: Recipe(id: "", name: name, image: imageURL, description: description, ingredients: ingredients, instructions: instructions, portions: portions, preparationTime: tiempo, publicationDate: date)) }}
                            navRecipe = true
                        }label: {
                            Label("Done", systemImage: "checkmark")
                                .labelStyle(.iconOnly)
                        }
                    
                    }
                    .disabled(name.isEmpty)
                }
                ToolbarItem(placement: .navigationBarLeading){
                    Button{
                        dismiss()
                    } label: {
                        Label("Cancel", systemImage: "xmark")
                            .labelStyle(.iconOnly)
                    }
                }
                
            })
            .navigationTitle("Añadir receta")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
    }
}

struct receta_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipe()
    }
}

/*extension AddRecipe {
    private func saveRecipe() {
        let currDate = Date()
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd"
        var datePublished = dateFormat.string(from: currDate)
        
        let recipe = Recipe(name: nombre, image: imageURL, description: descripcion, ingredients: ingredientes, instructions: instrucciones,  portions: porciones, preparationTime: tiempo, publicationDate: datePublished)
        
        recipesVM.addRecipe(recipe: recipe)
    }
    
}*/
