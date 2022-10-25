//
//  Exercicio.swift
//  MyCheckGym
//
//  Created by user on 17/10/22.
//

import Foundation

class Exercicio {
    //MARK: - Atributos
    let descricao:String
    let musculo:Musculo
    
    
    //MARK: - Inicializadores
    init?() {
        return nil
    }
    
    init(descricao:String, musculo:Musculo) {
        self.descricao = descricao
        self.musculo = musculo
    }
}
