import Foundation









struct recetasData: Codable {
	let q: String
	let hits: [hits]

}

struct hits: Codable{
	let recipe: recipe
 
}

struct recipe: Codable{
	let label: String
	let image: String
	let healthLabels: [String]
	//let ingredients: [String]
	let ingredientLines: [String]
    let calories: Float
    let yield: Float


}
