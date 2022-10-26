//
//  ExerciciosTableViewController.swift
//  MyCheckGym
//
//  Created by user on 18/10/22.
//

import UIKit
protocol IncluirExerciciosDelegate {
    func incluirExercicios(_ exercicios: [Exercicio])
}

class ExerciciosTableViewController: UITableViewController, CadastrarExercicioDelegate {
    // MARK: - IBOutlets
    
    
    //MARK: - Atributos
    var exercicios = [Exercicio(descricao: "Supino inclinado", musculo: (Musculo("Peitoral"))),
                      Exercicio(descricao: "Supino reto", musculo: (Musculo("Peitoral"))),
                      Exercicio(descricao: "Supino declinado", musculo: (Musculo("Peitoral")))]
    var exercicioSelecionado:[Exercicio] = []
    
    // MARK: - UITableViewController
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
        
        let longPress = UILongPressGestureRecognizer(
            target: self,
            action: #selector(mostrarDetalhes(_ :)))
        celula.addGestureRecognizer(longPress)
        
        if celula.accessoryType == .none {
            celula.accessoryType = .checkmark
            exercicioSelecionado.append(exercicios[indexPath.row])
        } else {
            celula.accessoryType = .none
        }
        
    }
    
    @objc func mostrarDetalhes(_ gestureRecognizer:UILongPressGestureRecognizer ) {
        if gestureRecognizer.state == .began {
            let celulaView = gestureRecognizer.view as! UITableViewCell
            guard let indexPath = tableView.indexPath(for: celulaView) else { return }
            let exercicio = exercicios[indexPath.row]
            
            let detalhes = exercicio.detalhes()
            let mensagem = "Deseja remover este exercicio?"
            let alerta = UIAlertController(title: detalhes, message: mensagem, preferredStyle: .alert)
            let botaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel)
            alerta.addAction(botaoCancelar)
            let botaoRemover = UIAlertAction(title: "Excluir", style: .destructive, handler: {
                alerta in
                self.exercicios.remove(at: indexPath.row)
                self.tableView.reloadData()
            })
            alerta.addAction(botaoRemover)
            present(alerta, animated: true, completion: nil)
        }
    }

    // MARK: - Delegate
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
