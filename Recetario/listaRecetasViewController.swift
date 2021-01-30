//
//  listaRecetasViewController.swift
//  Recetario
//
//  Created by Mac2 on 17/01/21.
//  Copyright © 2021 Mac2. All rights reserved.
//

import Foundation
import UIKit

class listaRecetas:UITableViewCell{
    
    @IBOutlet weak var tituloRecetaLabel: UILabel!
    @IBOutlet weak var numeroIngredientesLabel: UILabel!
    @IBOutlet weak var categoriaListaLabel: UILabel!
    @IBOutlet weak var imagen: UIImageView!
    @IBAction func verButton(_ sender: UIButton) {
    }
}

class listaRecetasViewController: UITableViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
