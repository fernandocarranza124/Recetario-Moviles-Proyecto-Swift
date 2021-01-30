//
//  UnicaViewController.swift
//  Recetario
//
//  Created by Mac13 on 29/01/21.
//  Copyright © 2021 Mac2. All rights reserved.
//

import UIKit

class UnicaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tituloPrincipal.text = recibeTitulo
        numIngredientes.text = String(recibenumIngredientes ?? 0)
        calorias.text = String(recibeCalorias ?? 0)
        proteinas.text = String(recibeProteinas ?? 0)
        imagenPrincipal.downloaded(from: recibeImagen ?? "")
        var ingredienteLista = ""
        for ingrediente in recibeIngredientes ?? ["nil"] {
            ingredienteLista = ingredienteLista+" "+ingrediente+"\n"
        }
        let atributo = NSMutableAttributedString(string: ingredienteLista)
        let parrafo = NSMutableParagraphStyle()
        parrafo.lineSpacing = 5
        ingredientes.text = ingredienteLista
        // Do any additional setup after loading the view.
    }
    var recibeTitulo:String?
    var recibenumIngredientes:Int?
    var recibeProteinas :Float?
    var recibeCalorias :Float?
    var recibeIngredientes :[String]?
    var recibeImagen: String?
    
    
    @IBOutlet weak var ingredientes: UILabel!
    @IBOutlet weak var calorias: UILabel!
    @IBOutlet weak var proteinas: UILabel!
    @IBOutlet weak var numIngredientes: UILabel!
    @IBOutlet weak var tituloPrincipal: UILabel!
    @IBOutlet weak var imagenPrincipal: UIImageView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

