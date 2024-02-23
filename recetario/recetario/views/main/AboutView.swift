//
//  AboutView.swift
//  recetario
//
//  Created by user246311 on 10/6/23.
//

import SwiftUI

struct AboutView: View {
        init() {
                UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.red]
            }
            
            @Environment(\.openURL) var openURL
            
            var body: some View {
                NavigationView{
                    ScrollView{
                        VStack(spacing: 10){
                            VStack{
                                Text("Una organización sin fines de lucro, constituida en el año 1991 y que tiene como misión “Generar acceso a una alimentación digna para personas en situación vulnerable en nuestra comunidad. Nuestro objetivo es contribuir a la reducción de la inseguridad alimentaria a través de, la entrega de despensas a familias en situación vulnerable en el Estado de Jalisco.")
                                    .padding(10)
                            }
                            
                            VStack(spacing: 50){
                                HStack(spacing: 50){
                                    VStack(spacing: 5){
                                        Image("familias")
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                        Text("30,211")
                                            .fontWeight(.black)
                                        Text("Familias atendidas mensualmente")
                                            .frame(width: 100, height: 100)
                                    }
                                    VStack(spacing: 5){
                                        Image("personas")
                                            .resizable()
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                        Text("137,027")
                                            .fontWeight(.black)
                                        Text("Personas atendidas mensualmente")
                                            .frame(width: 100, height: 100)
                                    }
                                }
                                
                                HStack(spacing: 50){
                                    VStack(spacing: 5){
                                        Image("comida")
                                            .resizable()
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                        Text("15'884,256 K.")
                                            .fontWeight(.black)
                                        Text("Alimento acopiado")
                                            .frame(width: 100, height: 100)
                                    }
                                    VStack(spacing: 5){
                                        Image("refugio")
                                            .resizable()
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                        Text("155")
                                            .fontWeight(.black)
                                        Text("Instituciones atendidas")
                                            .frame(width: 100, height: 100)
                                    }
                                }
                            }
                            
                            VStack(spacing: 10){
                                Button(action: {
                                    openURL(URL(string: "https://bdalimentos.org/make-a-donation/?cause_id=8492")!)
                                }, label: {
                                    Text("DONA AQUI")
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(
                                            Color.red
                                                .cornerRadius(10)
                                        )
                                })
                            }
                        }
                    }
                    .navigationTitle("Quienes somos")
                    }
                
                }
        }


struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
