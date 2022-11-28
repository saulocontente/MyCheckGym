//
//  TreinoTableViewController.swift
//  MyCheckGym
//
//  Created by user on 18/10/22.
//

import UIKit

class TreinoTableViewController: UITableViewController, IncluirExerciciosDelegate {
    
    //MARK: - IBOutlets
    
    @IBOutlet var treinoTV: UITableView!
    
    // MARK: - Atributos
    var exercicios: [Exercicio] = []
    
    //MARK: - Metodos
    @objc func adicionarExercicios () {
        let adicionarExercicios = ExerciciosTableViewController(delegate: self)
        navigationController?.pushViewController(adicionarExercicios, animated: true)
    }
    
    
    //MARK: - VIEW LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        treinoTV.dataSource = self
        treinoTV.delegate = self
        let botaoAdicionarExercicio = UIBarButtonItem(title: "+Exercicio", style: .plain, target: self, action: #selector(adicionarExercicios))
        navigationItem.rightBarButtonItem = botaoAdicionarExercicio
    }
    
    
    // MARK: - UITableViewController
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercicios.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "TreinoExercicioTableViewCell") as! TreinoExercicioTableViewCell
        
        let celula  = UITableViewCell(style: .default, reuseIdentifier: nil)
        let exercicio = exercicios[indexPath.row]
        //cell.treinoExercicio.text = exercicio.descricao
        //cell.treinoMusculo.text = exercicio.musculo.nome
        celula.textLabel?.text = exercicio.descricao
        return celula
    }
    
    
    
    //MARK: - IncluirExerciciosDelegate
    func incluirExercicios(_ listaExercicios: [Exercicio]) {
        print("Delegate \(listaExercicios)")
        exercicios.append(contentsOf: listaExercicios)
        print("Delegate \(exercicios)")
        if let tableView = treinoTV {
            //TreinosDAO().salvaTreinos(treinos)
            tableView.reloadData()

        } else {
            let mensagem = "Erro ao atualizar a lista de exercicios"
            Alerta(uiViewController: self).exibe(mensagem: mensagem)
        }
    }
}
