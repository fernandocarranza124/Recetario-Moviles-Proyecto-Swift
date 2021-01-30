//
//  TablaTableViewController.swift
//  Recetario
//
//  Created by Mac2 on 20/01/21.
//  Copyright © 2021 Mac2. All rights reserved.
//

import UIKit

class celdaView: UITableViewCell{
    @IBOutlet weak var imagenReceta: UIImageView!
    @IBOutlet weak var tituloReceta: UILabel!
    @IBOutlet weak var numeroIngredientes: UILabel!
    @IBOutlet weak var categoriaLabel: UILabel!
    @IBOutlet weak var vistaBoton: UIButton!
    
}


class TablaTableViewController: UITableViewController {
    private let arreglo  = [
        Receta(titulo: "pollo",numeroIngredientes: 3, categoria: "sodio", imagen: nil),
        Receta(titulo: "res",numeroIngredientes: 3, categoria: "sodio", imagen: nil),
    
    
    ]
    
    private var mytableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
            self.tableView.delegate = self
        
        self.registertable()
        print ("didLoad")
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    public func registertable() {
        let cell = UINib(nibName: "reuseIdentifier", bundle: nil)
        self.tableView.register(celdaView.self, forCellReuseIdentifier: "reuseIdentifier")
    }
    
    
    struct Receta {
        var titulo: String
        var numeroIngredientes: Int
        var categoria: String
        var imagen: UIImageView!
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arreglo.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as? celdaView
            
        

        let receta = arreglo[indexPath.row]
        cell.categoriaLabel.text = receta.categoria
        //cell?.tituloReceta.text = receta.titulo
  //      cell!.numeroIngredientes.text = String(receta.numeroIngredientes)
    //    cell!.categoriaLabel.text = receta.categoria
        
        print ("si")

        return cell!
    }
     
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
