//
//  TreinosTableViewController.swift
//  MyCheckGym
//
//  Created by user on 18/10/22.
//

import UIKit

class TreinosTableViewController: UITableViewController, IncluirExerciciosDelegate {
    
    
    // MARK: - Atributos
    var exercicios: [Exercicio] = []
    
    //MARK: - IBOutlets
    
    
    // MARK: - UITableViewController
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercicios.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let exercicio = exercicios[indexPath.row]

        return cell
    }
    
    
    //MARK: - IncluirExerciciosDelegate
    func incluirExercicios(_ exercicios: [Exercicio]) {
        self.exercicios.append(contentsOf: exercicios)
    }
}
