//
//  RemoveExercicioViewController.swift
//  MyCheckGym
//
//  Created by user on 29/10/22.
//

import UIKit

class RemoveExercicioViewController {
    
    var uiViewController: UIViewController
    
    init(uiViewController:UIViewController) {
        self.uiViewController = uiViewController
    }
    
    func exibeAlerta(_ exercicio: Exercicio, handler: @escaping (UIAlertAction)-> Void) {
        let detalhes = exercicio.detalhes()
        let mensagem = "Deseja remover este exercicio?"
        let alerta = UIAlertController(title: detalhes, message: mensagem, preferredStyle: .alert)
        let botaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel)
        alerta.addAction(botaoCancelar)
        let botaoRemover = UIAlertAction(title: "Excluir", style: .destructive, handler: handler)
        alerta.addAction(botaoRemover)
        uiViewController.present(alerta, animated: true, completion: nil)
    }
    
}
