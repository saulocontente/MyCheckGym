//
//  Exercicio.swift
//  MyCheckGym
//
//  Created by user on 17/10/22.
//

import Foundation

class Exercicio: NSObject, NSCoding, NSSecureCoding {
    static var supportsSecureCoding: Bool = true
    
    
    //MARK: - Atributos
    let descricao:String
    let musculo:Musculo
    
    //MARK: - Inicializadores
    init(descricao:String, musculo:Musculo) {
        self.descricao = descricao
        self.musculo = musculo
    }
    
    //MARK: - NSCoding
    func encode(with coder: NSCoder) {
        coder.encode(descricao, forKey: "descricao")
        coder.encode(musculo, forKey: "musculo")
    }
    
    required init?(coder: NSCoder) {
        descricao = coder.decodeObject(forKey: "descricao") as! String
        musculo = coder.decodeObject(forKey: "musculo") as! Musculo
    }
    
    // MARK: - Metodos
    func detalhes()-> String {
        var mensagem = "Exercicio: \(descricao)"
        mensagem += "\nMusculo: \(musculo.nome)"
        return mensagem
    }
}
