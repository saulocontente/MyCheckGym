//
//  ExerciciosDAO.swift
//  MyCheckGym
//
//  Created by user on 28/10/22.
//

import Foundation

class ExerciciosDAO {
    
    func retornaDiretorioExercicios() -> URL? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        let caminho = diretorio.appendingPathComponent("exercicios")
        return caminho
    }
    
    func salvaExercicios(_ exercicios:Array<Exercicio> ) {
        guard let caminho = retornaDiretorioExercicios() else {return}
        do{
            let dados = try NSKeyedArchiver.archivedData(withRootObject: exercicios, requiringSecureCoding: false)
            try dados.write(to: caminho)
        } catch {
            print("Erro: \(error.localizedDescription)")
            return
        }
    }
    
    func recuperaExercicios() -> Array<Exercicio> {
        guard let caminho = retornaDiretorioExercicios() else { return []}
        do {
            let dados = try Data(contentsOf: caminho)
            guard let listaExerciciosSalvos =  try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as? Array<Exercicio>
            else {return []}
            return listaExerciciosSalvos
        }catch {
            print("Erro \(error.localizedDescription)")
            return []
        }
    }
    
}
