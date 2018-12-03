//
//  MascotaTableViewController.swift
//  MascotaSaludable
//
//  Created by iPhone on 12/2/18.
//  Copyright © 2018 iPhone. All rights reserved.
//

import UIKit

class MascotaTableViewController: UITableViewController {

    var mascotas = [Mascota]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSimplePets()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mascotas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "MascotaTableViewCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MascotaTableViewCell
        
        // Fetches the appropriate meal for the data source layout.
        let mascota = mascotas[indexPath.row]
        
        //cell.nameLabel.text = meal.name
        //cell.photoImageView.image = meal.photo
        //cell.ratingControl.rating = meal.rating
        
        cell?.lblNombre.text = mascota.nombre
        cell?.photoImageView.image = mascota.foto
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: Private methods
    
    private func loadSimplePets(){
        let photo1 = UIImage(named: "mascotaSample01")!
        let photo2 = UIImage(named: "mascotaSample02")!
        
        let mascota01 = Mascota(nombre: "NamePet01", foto: photo1, fechaNacimiento: "15-03-2012", propietario: "Property01", peso: "12", comentarios: "Comentario")
        
        let mascota02 = Mascota(nombre: "NamePet02", foto: photo2, fechaNacimiento: "15-03-2014", propietario: "Property02", peso: "14", comentarios: "Comentario2")
        
        mascotas += [mascota01, mascota02]
    }
    
    @IBAction func unwindToPetsList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? AgregarMascotaViewController, let mascota = sourceViewController.mascota {
            
            // Add a new meal.
            let newIndexPath = IndexPath(row: mascotas.count, section: 0)
            
            mascotas.append(mascota)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }

}
