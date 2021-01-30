//
//  listarViewController.swift
//  Recetario
//
//  Created by Mac13 on 29/01/21.
//  Copyright © 2021 Mac2. All rights reserved.
//

import UIKit
import CoreData
class listarViewController: UIViewController, recetasManagerDelegate {
    
    func actualizarReceta(recetas: recetasModelo) {
        DispatchQueue.main.async {
            print("manager 2")
            self.actualiza(receta1: recetas.Receta1, receta2: recetas.Receta2, receta3:recetas.Receta3)
        }
        
    }
    var Globalreceta1: recipe?
    var Globalreceta2: recipe?
    var Globalreceta3: recipe?
    func actualiza(receta1: recipe, receta2:recipe, receta3:recipe) {
        print("entra")
        Globalreceta1 = receta1
        Globalreceta2 = receta2
        Globalreceta3 = receta3
        receta1Titulo.text = receta1.label
        var numero = receta1.ingredientLines.count
        receta1num.text = String(numero)
        receta1categoria.text = receta1.healthLabels[0]
        
        receta2Titulo.text = receta2.label
        numero = receta2.ingredientLines.count
        receta2num.text = String(numero)
        receta2categoria.text = receta2.healthLabels[0]
        
        receta3Titulo.text = receta3.label
        numero = receta3.ingredientLines.count
        receta3num.text = String(numero)
        receta3categoria.text = receta3.healthLabels[0]
        
        receta1img.downloaded(from: receta1.image)
        receta2img.downloaded(from: receta2.image)
        receta3img.downloaded(from: receta3.image)
    }
    @IBOutlet weak var receta1Titulo: UILabel!
    @IBOutlet weak var receta1num: UILabel!
    @IBOutlet weak var receta1categoria: UILabel!
    @IBAction func receta1Boton(_ sender: Any) {
    }
    
    @IBOutlet weak var receta2Titulo: UILabel!
    @IBOutlet weak var receta2num: UILabel!
    @IBOutlet weak var receta2categoria: UILabel!
    @IBAction func receta2Boton(_ sender: Any) {
    }
    
    @IBOutlet weak var receta3Titulo: UILabel!
    @IBOutlet weak var receta3num: UILabel!
    @IBOutlet weak var receta3categoria: UILabel!
    @IBAction func receta3Boton(_ sender: Any) {
    }
    
    @IBOutlet weak var receta1img: UIImageView!
    @IBOutlet weak var receta2img: UIImageView!
    @IBOutlet weak var receta3img: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Manager.delegado = self
        print(recibeCategoria)
        categoria.text = recibeCategoria
        Manager.fetchRecetas(palabraClave: recibeCategoria ?? "nada")
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "single1" {
            let listaController = segue.destination as! UnicaViewController
            listaController.recibeTitulo = receta1Titulo.text
            var numero = Globalreceta1!.ingredientLines.count
            listaController.recibenumIngredientes = numero
            listaController.recibeIngredientes = Globalreceta1?.ingredientLines
            listaController.recibeCalorias = Globalreceta1?.calories
            listaController.recibeProteinas = Globalreceta1?.yield
            listaController.recibeImagen = Globalreceta1?.image
            
        }
        if segue.identifier == "single2" {
            let listaController = segue.destination as! UnicaViewController
            listaController.recibeTitulo = receta2Titulo.text
            var numero = Globalreceta2!.ingredientLines.count
            listaController.recibenumIngredientes = numero
            listaController.recibeIngredientes = Globalreceta2?.ingredientLines
            listaController.recibeCalorias = Globalreceta2?.calories
            listaController.recibeProteinas = Globalreceta2?.yield
            listaController.recibeImagen = Globalreceta2?.image
        }
        if segue.identifier == "single3" {
            let listaController = segue.destination as! UnicaViewController
            listaController.recibeTitulo = receta3Titulo.text
            var numero = Globalreceta3!.ingredientLines.count
            listaController.recibenumIngredientes = numero
            listaController.recibeIngredientes = Globalreceta3?.ingredientLines
            listaController.recibeCalorias = Globalreceta3?.calories
            listaController.recibeProteinas = Globalreceta3?.yield
            listaController.recibeImagen = Globalreceta3?.image
            
        }
    }
    
    var Manager = recetasManager()
    
    @IBOutlet weak var categoria: UILabel!
    var recibeCategoria: String?
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
            }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

