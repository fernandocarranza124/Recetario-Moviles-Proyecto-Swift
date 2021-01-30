//
//  ViewController.swift
//  Recetario
//
//  Created by Mac2 on 20/12/20.
//  Copyright © 2020 Mac2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
var Manager = recetasManager()

    @IBOutlet weak var entradaTextField: UITextField!
    
    @IBAction func buscaPollo(_ sender: Any) {
        buscar = "Pollo"
    }
    @IBAction func buscaCarnes(_ sender: Any) {
        buscar = "Carnes"
    }
    
    @IBAction func buscaBebidas(_ sender: Any) {
        buscar = "Bebidas"
    }
    
    @IBAction func buscaPastas(_ sender: Any) {
        buscar = "Pasta"
    }
    
    @IBAction func buscaPescado(_ sender: Any) {
        buscar = "Pescado"
    }
    
    @IBAction func buscaSopa(_ sender: Any) {
        buscar = "Sopa"
    }
    
    
    @IBAction func busquedaTextField(_ sender: UITextField) {
        var entrada = entradaTextField.text
        print(entrada)
    }
    @IBAction func buscar(_ sender: Any) {
        var entrada = entradaTextField.text
        Manager.fetchRecetas(palabraClave: entrada ?? "res")
        buscar = entrada
    }
    var buscar: String?
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "listar" {
            let listaController = segue.destination as! listarViewController
            listaController.recibeCategoria = buscar
        }
    }
}

