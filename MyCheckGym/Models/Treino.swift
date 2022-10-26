//
//  Treino.swift
//  MyCheckGym
//
//  Created by user on 25/10/22.
//

import Foundation

class Treino {
    
    //MARK: - Atributos
    let exercicios:[Exercicio]
    let repeticoesPlanejadas: Int
    let repeticoesExecutadas: Int
    let carga: Double
    
    //MARK: Inicializadores
    init (exercicios:[Exercicio], repeticoesPlanejadas: Int = 0, repeticoesExecutadas: Int = 0, carga: Double = 0.0) {
        self.exercicios = exercicios
        self.repeticoesPlanejadas = repeticoesPlanejadas
        self.repeticoesExecutadas = repeticoesExecutadas
        self.carga = carga
    }
}
