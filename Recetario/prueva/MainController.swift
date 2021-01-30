//
//  MainController.swift
//  Recetario
//
//  Created by Mac13 on 24/01/21.
//

import UIKit

class MainController: UIViewController {
    /*func actualizarReceta(recetas: recetasModelo) {
        DispatchQueue.main.async {
            print("manager")
            //print(recetas.Busqueda!)
            //print(recetas.Receta1.label)
            self.objRecetas = recetas
            var listarRecetas = listarRecetasViewController()
           
        
            
            
        }
        
    }*/
    var objRecetas = recetasModelo(Busqueda: nil, Receta1: nil)
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "listarRecetas" {
            if objRecetas.Receta1 != nil {
                Manager.fetchRecetas(palabraClave: "pollo")
                
                print("segue")
                let listaController = segue.destination as! listarRecetasViewController
                listaController.tituloPrimer = objRecetas.Receta1.label ?? "nil"
                let cantidad = objRecetas.Receta1.ingredientLines.count
                listaController.cantidadIngredientesPrimer = cantidad
                listaController.ingredientesPrimer = objRecetas.Receta1.ingredientLines
                //listaController.categoriaPrimer = objRecetas.Receta1.healthLabels[] ?? "nil"
                listaController.busqueda = objRecetas.Busqueda
                
            }else{
                print(objRecetas.Receta1)
            }
            
            //listaController.recetasRecibidas = objRecetas
        }
    }
    
var Manager = recetasManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print("pollos")
        // Do any additional setup after loading the view.
       //textFieldBusca.delegate = self
        //Manager.delegado = self
        Manager.fetchRecetas(palabraClave: "nada")
        
    }
    
   
    @IBAction func boton(_ sender: Any) {
        //print("carnes")
        var view = listarRecetasViewController()
        
        let buscar = textFieldBusca.text
        view.actualizar(palabra: buscar ?? "pollo")
        Manager.fetchRecetas(palabraClave: buscar!)
        
    }
    
    @IBOutlet weak var textFieldBusca: UITextField!
    
    @IBAction func busqueda(_ sender: Any) {
    }
    
    
    
    @IBAction func verCarnes(_ sender: Any) {
        Manager.fetchRecetas(palabraClave: "Carne")
    }
    @IBAction func verPescado(_ sender: Any) {
        Manager.fetchRecetas(palabraClave: "Pescado")
    }
    @IBAction func verPostres(_ sender: Any) {
        Manager.fetchRecetas(palabraClave: "Postres")
    }
    @IBAction func verPollo(_ sender: Any) {
        Manager.fetchRecetas(palabraClave: "Pollo")
    }
    @IBAction func verBebida(_ sender: Any) {
        Manager.fetchRecetas(palabraClave: "Bebida")
    }
    @IBAction func verVerdura(_ sender: Any) {
        Manager.fetchRecetas(palabraClave: "Verdura")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
