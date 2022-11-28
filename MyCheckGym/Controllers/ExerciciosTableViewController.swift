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
    @IBOutlet var exerciciosTableView: UITableView!
    
    
    // MARK: - Atributos
    var exercicios:[Exercicio] = []
    var listaExerciciosSelecionados:[Exercicio]? = []
    var delegate: IncluirExerciciosDelegate?
    
    init(delegate: IncluirExerciciosDelegate) {
        super.init(nibName: "ExerciciosTableView", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        exercicios = ExerciciosDAO().recuperaExercicios()
        exerciciosTableView.dataSource = self
        exerciciosTableView.delegate = self
        let botaoCadastrarExercicio =  UIBarButtonItem(title: "Cadastrar", style: .plain, target: self, action: #selector(cadastrarExercicio))
        navigationItem.rightBarButtonItem = botaoCadastrarExercicio
    }
    
    @objc func cadastrarExercicio() {
        let exerciciosViewController = ExerciciosViewController(delegate: self)
        navigationController?.pushViewController(exerciciosViewController, animated: true)
    }
    
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
            listaExerciciosSelecionados?.append(exercicios[indexPath.row])
        } else {
            celula.accessoryType = .none
        }
    }
    
    @objc func mostrarDetalhes(_ gestureRecognizer:UILongPressGestureRecognizer ) {
        if gestureRecognizer.state == .began {
            let celulaView = gestureRecognizer.view as! UITableViewCell
            guard let indexPath = tableView.indexPath(for: celulaView) else { return }
            let exercicio = exercicios[indexPath.row]
            RemoveExercicioViewController(uiViewController: self).exibeAlerta(exercicio, handler: {
                alerta in
                self.exercicios.remove(at: indexPath.row)
                self.tableView.reloadData()
            })
            
        }
    }

    // MARK: - Delegate
    func cadastrar(_ exercicio: Exercicio) {
        exercicios.append(exercicio)
        if let tableView = exerciciosTableView {
            ExerciciosDAO().salvaExercicios(exercicios)
            tableView.reloadData()
            
        } else {
            let mensagem = "Erro ao atualizar a lista de exercicios"
            Alerta(uiViewController: self).exibe(mensagem: mensagem)
        }
    }
    
    //MARK: - Actions
    
    @IBAction func incluirNoTreino(_ sender: Any) {
        if let exercicios = listaExerciciosSelecionados {
            delegate?.incluirExercicios(exercicios)
            navigationController?.popViewController(animated: true)
        } else {
            return
        }
        
    }
}
