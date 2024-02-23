//
//  RecetaModel.swift
//  recetario
//
//  Created by user246311 on 10/4/23.
//

import Foundation
import FirebaseFirestore

struct Recipe: Identifiable, Codable{
    let id: String
    let name: String?
    let image: String?
    let description: String?
    let ingredients: String?
    let instructions: String?
    let portions: String?
    let preparationTime: String?
    let publicationDate: String?
    
}

extension Recipe{
    static let all: [Recipe] = [
        Recipe(id: "1", name: "Chilaquiles verdes", image: "https://patijinich.com/es/wp-content/uploads/sites/3/2017/07/207-chilaquiles-verdes.jpg", description: "La receta de cómo hacer chilaquiles verdes es quizá la más básica en cualquier cocina mexicana. Este platillo es muy fácil de hacer, va acompañado de crema, queso y cebolla, y sólo te tomará 30 minutos hacerlos. Consiste en freír tortillas y después bañarlas en una rica salsa verde. Para que te queden más crujientes los totopos, te recomendamos servir la salsa al momento.", ingredients: "8 tomates verdes, 1/4 cebollas, 4 chiles serranos, 1 diente de ajo, 1 manojo de cilantro fresco, 2 cucharadas de aceite vegetal, suficiente de tortilla, cortadas en forma triangular, del día anterior, suficiente de aceite vegetal, para freír, 1 pechuga de pollo, cocido y deshebrado, suficiente de crema, reducida en grasa para acompañar, suficiente de queso fresco, desmoronado, para acompañar, suficiente de cebolla, fileteada", instructions: "En una olla con agua hirviendo, cuece los tomates verdes, la cebolla y los chiles por 5 minutos. Muele los ingredientes que cociste junto con el ajo y el cilantro, hasta que obtengas una textura tersa. En un sartén, agrega el aceite vegetal y fríe la salsa, cocina por 5 minutos y reserva. Para los totopos: primero calienta un sartén profundo y luego, calienta suficiente aceite para freír los totopos por 3 minutos. Para el montaje: Coloca una base con los totopos, el pollo deshebrado y agrega la salsa caliente encima. Acompaña con crema, queso y cebolla fileteada. Disfruta.", portions: "4", preparationTime: "40 min", publicationDate: "05-10-23")
    ]
}
