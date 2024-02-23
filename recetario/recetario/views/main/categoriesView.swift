//
//  categoriesView.swift
//  recetario
//
//  Created by user246311 on 10/4/23.
//

import SwiftUI

struct categoriesView: View {
    var body: some View {
        NavigationView{
            Text("Categorias")
                .navigationTitle("Categorias")
        }
        .navigationViewStyle(.stack)
    }
}

struct categoriesView_Previews: PreviewProvider {
    static var previews: some View {
        categoriesView()
    }
}
