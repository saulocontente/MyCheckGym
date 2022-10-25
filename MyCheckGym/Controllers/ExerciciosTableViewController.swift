//
//  ExerciciosTableViewController.swift
//  MyCheckGym
//
//  Created by user on 18/10/22.
//

import UIKit

class ExerciciosTableViewController: UITableViewController, CadastrarExercicioDelegate {
    // MARK: - IBOutlets
    
    
    //MARK: - Atributos
    var exercicios = [Exercicio(descricao: "Supino inclinado", musculo: (Musculo("Peitoral"))),
                      Exercicio(descricao: "Supino reto", musculo: (Musculo("Peitoral"))),
                      Exercicio(descricao: "Supino declinado", musculo: (Musculo("Peitoral")))]
    var exercicioSelecionado:Exercicio? = nil
    // MARK: - View life cycle
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercicios.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let linha = indexPath.row
        let exercicio = exercicios[linha]

        celula.textLabel?.text = exercicio.descricao
        return celula
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let celula = tableView.cellForRow(at: indexPath) else { return }
        if exercicioSelecionado == nil {
            if celula.accessoryType == .none {
                celula.accessoryType = .checkmark
                exercicioSelecionado = exercicios[indexPath.row]
            } else {
                celula.accessoryType = .none
                exercicioSelecionado = nil
            }
        } else {
            if celula.accessoryType == .checkmark {
                celula.accessoryType = .none
                exercicioSelecionado = nil
            }
        }
    }
    
    func cadastrar(_ exercicio: Exercicio) {
        exercicios.append(exercicio)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "cadastrarExercicio" {
            if let viewController = segue.destination as? ExerciciosViewController {
                viewController.exerciciosTableViewDelegate = self
            }
        }
    }
}
