//
//  RegistroViewController.swift
//  Recetario
//
//  Created by Mac13 on 30/01/21.
//  Copyright © 2021 Mac2. All rights reserved.
//  @

import UIKit
import FirebaseAuth
class RegistroViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registrate(_ sender: Any) {
        let user = usuario.text ?? "usuario"
        let pass = password.text ?? "password"
        Auth.auth().createUser(withEmail: user, password: pass) {
            user, error in
        }
        print("error")
        let alerta = UIAlertController(title: "Usuario creado", message: "Accede a la seccion de iniciar sesión", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alerta.addAction(defaultAction)
        self.present(alerta,animated: true, completion:nil)
        print("usuario creado")
    }
    @IBAction func contrasena(_ sender: Any) {
    }
    @IBOutlet weak var usuario: UITextField!
    @IBOutlet weak var password: UITextField!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
