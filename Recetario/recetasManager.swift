import Foundation
protocol recetasManagerDelegate {
    func actualizarReceta(recetas: recetasModelo)
}

struct recetasManager {
	var delegado: recetasManagerDelegate?

	var url = "https://test-es.edamam.com/search?&app_id=8f8bbdc8&app_key=c5b8632097756ff3ce7be207ad81d75a&to=3"

	func fetchRecetas(palabraClave: String){
		let urlString = "\(url)&q=\(palabraClave)"
		realizarPeticion(urlString: urlString)
	}
	func realizarPeticion(urlString: String){
		if let url = URL(string: urlString){
            //print ("url")
            let session = URLSession(configuration: .default)
            
            let tarea = session.dataTask(with: url) { (data,respuesta,error) in
                if error != nil {
                    
                    return
                }
                //print("data")
                if let datosSeguros = data {
                    if let recetas = self.parseJson(recetasdata: datosSeguros){
                        //print("datosSeguros")
                        //print(recetas.Busqueda)
                        self.delegado?.actualizarReceta(recetas: recetas)
                        
                        
                    }
                }
            }
            
            
            
            tarea.resume()
        }
        
    }
    func parseJson(recetasdata: Data) -> recetasModelo? {
        let decoder = JSONDecoder()
        
        do{
        	let dataDecodificada = try decoder.decode(recetasData.self, from: recetasdata)
            
        	let busqueda = String(dataDecodificada.q)
            let receta1 = dataDecodificada.hits[0].recipe
            //let receta1 = dataDecodificada.hits[0].recipe
            let receta2 = dataDecodificada.hits[1].recipe
            let receta3 = dataDecodificada.hits[2].recipe

        	//print("receta1")
            //print(receta1)
            let objReceta = recetasModelo(Busqueda: busqueda, Receta1: receta1, Receta2: receta2, Receta3:receta3)
            
            //let objReceta = recetasModelo(Busqueda: busqueda)
            return objReceta
        }catch{
        	print (error)
        	return nil
        }
    }




}

	
