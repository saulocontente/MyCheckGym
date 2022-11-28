//
//  TreinosDAO.swift
//  MyCheckGym
//
//  Created by user on 24/11/22.
//

import Foundation

class TreinosDAO {
    func retornaDiretorio () -> URL? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        let caminho = diretorio.appendingPathComponent("treinos")
        return caminho
    }
    
    func salvaTreinos(_  listaTreinos: Array<Treino>) {
        guard let caminho = retornaDiretorio() else { return }
        do{
            let dados = try NSKeyedArchiver.archivedData(withRootObject: listaTreinos, requiringSecureCoding: false)
            try dados.write(to: caminho)
        } catch {
            print("Erro: \(error.localizedDescription)")
            return
        }
    }
    
    func recuperaTreino() -> Array<Treino> {
        guard let caminho = retornaDiretorio() else { return [] }
        do {
            let dados = try Data(contentsOf: caminho)
            guard let listaTreinos = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as? Array<Treino>
            else {
                return[]
            }
            return listaTreinos
        } catch {
            print("Erro: \(error.localizedDescription)")
            return []
        }
    }
}
