//
//  Alerta.swift
//  MyCheckGym
//
//  Created by user on 26/10/22.
//

import UIKit

class Alerta {
    
    let uiViewController: UIViewController
    
    init (uiViewController:UIViewController) {
        self.uiViewController = uiViewController
    }
    
    func exibe(titulo:String = "Atenção", mensagem:String) {
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let botaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel)
        alerta.addAction(botaoCancelar)
        uiViewController.present(alerta, animated: true, completion: nil)
    }
}
