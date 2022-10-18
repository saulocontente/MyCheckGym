//
//  ExerciciosTableViewController.swift
//  MyCheckGym
//
//  Created by user on 18/10/22.
//

import UIKit

class ExerciciosTableViewController: UITableViewController {
    // MARK: - IBOutlets
    
    
    //MARK: - Atributos
    let exercicios = [Exercicio(descricao: "Supino inclinado", musculo: "Peitoral"),
                      Exercicio(descricao: "Supino reto", musculo: "Peitoral"),
                      Exercicio(descricao: "Supino declinado", musculo: "Peitoral"),]
    
    // MARK: - View life cycle
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("contador")
        return exercicios.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("celula")
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let linha = indexPath.row
        let exercicio = exercicios[linha]

        celula.textLabel?.text = exercicio.descricao
        return celula
    }
}
