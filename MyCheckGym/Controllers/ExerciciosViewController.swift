//
//  ExerciciosViewController.swift
//  MyCheckGym
//
//  Created by user on 17/10/22.
//

import UIKit

class ExerciciosViewController: UIViewController, UITableViewDataSource {
    
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var descricaoTextField: UITextField?
    @IBOutlet weak var musculosTableView: UITableView?
    
    //MARK: - Atributos
    let musculos:[Musculo] = [Musculo("Peitoral"),
                              Musculo("Dorsal"),
                              Musculo("Quadríceps"),
                              Musculo("Fêmoral"),
                              Musculo("Deltóide"),
                              Musculo("Bíceps"),
                              Musculo("Tríceps"),
                              Musculo("Panturrilha")]
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: Table View Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musculos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let musculo = musculos[indexPath.row]
        celula.textLabel?.text = musculo.nome
        return celula
    }
    
    
}
