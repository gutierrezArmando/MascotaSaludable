//
//  AgregarMascotaViewController.swift
//  MascotaSaludable
//
//  Created by iPhone on 12/1/18.
//  Copyright © 2018 iPhone. All rights reserved.
//

import UIKit
import os.log

class AgregarMascotaViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var Picker: UIDatePicker!
    
    @IBOutlet weak var textFieldNombre: UITextField!
    @IBOutlet weak var textFieldPropietario: UITextField!
    @IBOutlet weak var textFieldPeso: UITextField!
    
    var mascota: Mascota?
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    
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
        let foto: UIImage = photoImageView.image!
        if !camposLlenos(nombre: nombre, propietario: propietario, peso: peso) {
            showMessageBox(title: "Error", message: "Falta uno o mas parametros")
        } else {
            agregarMascota(nombre: nombre, foto: foto, fecha: getDateFormat(), propietario: propietario, peso: peso)
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
    
    func agregarMascota(nombre: String, foto: UIImage, fecha: String, propietario: String, peso: String) {
        mascota = Mascota(nombre: nombre, foto: foto, fechaNacimiento: fecha, propietario: propietario, peso: peso, comentarios: "")
        print("Mascota agregada:\n\(nombre)\n\(fecha)\n\(propietario)\n\(peso)\n")
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

    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        photoImageView.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
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
        let nombre: String = textFieldNombre.text!
        let propietario: String = textFieldPropietario.text!
        let peso: String = textFieldPeso.text!
        let foto: UIImage = photoImageView.image!
        let fecha: String = getDateFormat()
        agregarMascota(nombre: nombre, foto: foto, fecha: fecha, propietario: propietario, peso: peso)

    }
    
    @IBAction func cancelar(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    

}
