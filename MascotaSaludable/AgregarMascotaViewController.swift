//
//  AgregarMascotaViewController.swift
//  MascotaSaludable
//
//  Created by iPhone on 12/1/18.
//  Copyright © 2018 iPhone. All rights reserved.
//

import UIKit

class AgregarMascotaViewController: UIViewController {

    @IBOutlet weak var Picker: UIDatePicker!
    
    @IBOutlet weak var textFieldNombre: UITextField!
    @IBOutlet weak var textFieldPropietario: UITextField!
    @IBOutlet weak var textFieldPeso: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnAceptarClick(_ sender: Any) {
        let nombre: String = textFieldNombre.text!
        let propietario: String = textFieldPropietario.text!
        let peso: String = textFieldPeso.text!
        if !camposLlenos(nombre: nombre, propietario: propietario, peso: peso) {
            showMessageBox(title: "Error", message: "Falta uno o mas parametros")
        } else {
            agregarMascota(nombre: nombre, fecha: getDateFormat(), propietario: propietario, peso: peso)
            showMessageBox(title: "Confirmacion", message: "Mascota Agregada")
            limpiarCampos()
        }
    }
    
    func camposLlenos(nombre: String, propietario: String, peso: String) -> Bool {
        if nombre.isEmpty || propietario.isEmpty || peso.isEmpty {
            return false
        }
        return true
    }
    
    func agregarMascota(nombre: String, fecha: String, propietario: String, peso: String) {
        print("Mascota agregada: \n \(nombre)\n\(fecha)\n\(propietario)\n\(peso)\n")
    }
    
    func getDateFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter.string(from: Picker.date)
    }
    
    func showMessageBox(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alertController.addAction(UIAlertAction(title: "Cerrar", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func limpiarCampos() {
        textFieldPeso.text = ""
        textFieldPropietario.text = ""
        textFieldNombre.text = ""
    }

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
