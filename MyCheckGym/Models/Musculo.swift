//
//  Musculo.swift
//  MyCheckGym
//
//  Created by user on 17/10/22.
//

import Foundation

class Musculo: NSObject, NSCoding {
    //MARK:- Atributos
    let nome:String
    
    //MARK: Inicializadores
    init (_ nome:String){
        self.nome = nome
    }
    //MARK: - NSCoding
    func encode(with coder: NSCoder) {
        coder.encode(nome, forKey: "nome")
    }
    
    required init?(coder: NSCoder) {
        nome = coder.decodeObject(forKey: "nome") as! String
    }
}
