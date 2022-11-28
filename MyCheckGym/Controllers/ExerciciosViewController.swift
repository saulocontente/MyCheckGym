//
//  ExerciciosViewController.swift
//  MyCheckGym
//
//  Created by user on 17/10/22.
//

import UIKit

protocol CadastrarExercicioDelegate {
    func cadastrar(_ exercicio: Exercicio)
}

class ExerciciosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var listaMusculoTableView: UITableView!
    @IBOutlet weak var descricaoTextField: UITextField?
    
    //MARK: - Atributos
    var musculos:[Musculo] = [Musculo("Peitoral"),
                              Musculo("Dorsal"),
                              Musculo("Quadríceps"),
                              Musculo("Fêmoral"),
                              Musculo("Deltóide"),
                              Musculo("Bíceps"),
                              Musculo("Tríceps"),
                              Musculo("Panturrilha")]
    var musculoSelecionado:Musculo? = nil
    var delegate:CadastrarExercicioDelegate?
    
    init(delegate: CadastrarExercicioDelegate) {
        super.init(nibName: "ExerciciosView", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        listaMusculoTableView.dataSource = self
        listaMusculoTableView.delegate = self
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musculos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let musculo = musculos[indexPath.row]
        celula.textLabel?.text = musculo.nome
        return celula
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let celula = tableView.cellForRow(at: indexPath) else { return }
        
        if musculoSelecionado == nil {
            if celula.accessoryType == .none {
                celula.accessoryType = .checkmark
                musculoSelecionado = musculos[indexPath.row]
            } else {
                celula.accessoryType = .none
                musculoSelecionado = nil
            }
        } else {
            if celula.accessoryType == .checkmark {
                celula.accessoryType = .none
                musculoSelecionado = nil
            }
        }
    }
    
    // MARK: - Actions
    @IBAction func cadastrar(_ sender: Any) {
        guard let descricaoExercicio = descricaoTextField?.text,
              let musculoExercicio = musculoSelecionado
        else { return }
        
        let exercicio = Exercicio(
            descricao: descricaoExercicio,
            musculo: musculoExercicio)
        delegate?.cadastrar(exercicio)
        navigationController?.popViewController(animated: true)
    }
}
