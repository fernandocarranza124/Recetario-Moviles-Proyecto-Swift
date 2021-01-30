//
//  listarRecetasViewController.swift
//  Recetario
//
//  Created by Mac13 on 25/01/21.
//

import UIKit

class listarRecetasViewController: UIViewController, recetasManagerDelegate {
    func actualizarReceta(recetas: recetasModelo) {
        DispatchQueue.main.async {
            print("manager2")
            //print(recetas.Busqueda!)
            //print(recetas.Receta1.label)
            
        }
    }
    var Manager = recetasManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        Manager.delegado = self
        //titulo1.text = recetasRecibidas.Receta1.label
        print("segundaPantalla")
        
        titulo1?.text = tituloPrimer ?? "nil"
        ingredientes1?.text = String(cantidadIngredientesPrimer ?? 0)
        
        categoria1?.text = categoriaPrimer ?? "n"
        if busqueda == "nada"
        
        {
            
            print("if")
            print(tituloPrimer)
            manager.fetchRecetas(palabraClave: "res")
            
            
        }else{
            print("else")
            print(tituloPrimer)
        }
        
        
        
        // Do any additional setup after loading the view.
    }
    func actualizar(palabra: String) {
        print ("actualiza")
        manager.fetchRecetas(palabraClave: palabra)
    }
    
    var manager = recetasManager()
    var tituloPrimer: String?
    var cantidadIngredientesPrimer: Int?
    var categoriaPrimer: String?
    var ingredientesPrimer: [String] = []
    var busqueda: String?
    
    var recetasRecibidas = recetasModelo(Busqueda: nil, Receta1: nil)
    
    @IBOutlet weak var titulo1: UILabel?
    @IBOutlet weak var ingredientes1: UILabel?
    @IBOutlet weak var categoria1: UILabel?
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
