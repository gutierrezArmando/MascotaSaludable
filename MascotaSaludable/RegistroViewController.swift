//
//  RegistroViewController.swift
//  MascotaSaludable
//
//  Created by iPhone on 11/30/18.
//  Copyright © 2018 iPhone. All rights reserved.
//

import UIKit

class RegistroViewController: UIViewController {

    @IBOutlet weak var textFieldCorreo: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldConfirmaPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func registrarUsuario(_ sender: Any) {
        let correo: String! = textFieldCorreo.text
        let password: String! = textFieldPassword.text
        let rePassword: String! = textFieldConfirmaPassword.text
        
        if camposValidos(correo: correo, password: password, rePassword: rePassword) {
            if passwordsVerificados(password: password, rePassword: rePassword) {
                agregarUsuario(correo: correo, password: password)

                let alertController = UIAlertController(title: "Confirmacion", message: "Usuario Agregado", preferredStyle: UIAlertControllerStyle.alert)
                
                alertController.addAction(UIAlertAction(title: "Cerrar", style: UIAlertActionStyle.default){ACTION in self.dismiss(animated: true, completion: nil)})
                
                self.present(alertController, animated: true, completion: nil)

            } else {
                showMessageBox(title: "Error", message: "Deben coincidir las contrasenias");
            }
        }
        else {
            showMessageBox(title: "Error", message: "Falta uno o mas valores")
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func camposValidos(correo: String, password: String, rePassword: String) -> Bool {
        if(correo.isEmpty || password.isEmpty || rePassword.isEmpty){
            return false
        }
        return true;
    }
    
    func passwordsVerificados(password: String, rePassword: String) -> Bool {
        if password != rePassword {
            return false
        }
        return true
    }
    
    func agregarUsuario(correo: String, password: String) {
        UserDefaults.standard.set(correo, forKey: "userEmail")
        UserDefaults.standard.set(password, forKey: "userPassword")
        print("Usuario Creado")
        //print(UserDefaults.standard.string(forKey: "userName") ?? "")
        //UserDefaults.standard.removeObject(forKey: "userName")
        //UserDefaults.standard.removeObject(forKey: "password")
    }
    
    func showMessageBox(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alertController.addAction(UIAlertAction(title: "Cerrar", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }

    @IBAction func cancelarRegistro(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
