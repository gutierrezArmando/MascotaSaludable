//
//  DetallesMascotaViewController.swift
//  MascotaSaludable
//
//  Created by iPhone on 12/3/18.
//  Copyright © 2018 iPhone. All rights reserved.
//

import UIKit
import os.log

class DetallesMascotaViewController: UIViewController {
    
    var mascota: Mascota?
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var imgFoto: UIImageView!
    @IBOutlet weak var lblFecha: UILabel!
    @IBOutlet weak var lblPropietario: UILabel!
    @IBOutlet weak var lblPeso: UILabel!
    
    @IBOutlet weak var txtComentarios: UITextView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblNombre.text = mascota?.nombre
        imgFoto.image = mascota?.foto
        lblFecha.text = "Fecha de nacimiento: " + (mascota?.fechaNacimiento)!
        lblPropietario.text = "Propietario: " + (mascota?.propietario)!
        lblPeso.text = "Peso: " + (mascota?.peso)! + "kg"
        txtComentarios.text = mascota?.comentarios
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        mascota?.actualizarComentarios(comentarioNuevo: txtComentarios.text)
        /*
        let nombre: String = textFieldNombre.text!
        let propietario: String = textFieldPropietario.text!
        let peso: String = textFieldPeso.text!
        let foto: UIImage = photoImageView.image!
        let fecha: String = getDateFormat()
        agregarMascota(nombre: nombre, foto: foto, fecha: fecha, propietario: propietario, peso: peso)
 */
    }

}
