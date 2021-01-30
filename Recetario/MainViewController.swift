//
//  MainViewController.swift
//  Recetario
//
//  Created by Mac13 on 29/01/21.
//  Copyright © 2021 Mac2. All rights reserved.
//

import UIKit
import FirebaseAuth

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    
    }
    
    @IBOutlet weak var usuario: UITextField!
    @IBAction func password(_ sender: Any) {
    }
    @IBOutlet weak var pass: UITextField!
    
    @IBAction func login(_ sender: Any) {
       /* Auth.auth().signIn(withEmail: self.usuario.text!) {
            (user, error) in
            
        }*/
        print("antes del log")
        Auth.auth().signIn(withEmail: self.usuario.text!, password: self.pass.text!) {
            [weak self] authResult, error in
            if error == nil{
                if #available(iOS 13.0, *) {
                    let vc = self?.storyboard?.instantiateViewController(identifier: "home")
                    self?.present(vc!, animated: true, completion: nil)
                } else {
                    print("error")
                    let alerta = UIAlertController(title: "Error", message: "Usuario no encontrado", preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alerta.addAction(defaultAction)
                    self?.present(alerta,animated: true, completion:nil)
                }
            }
        }
        
        
    }
    

    

}
