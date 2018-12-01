//
//  LoginViewController.swift
//  MascotaSaludable
//
//  Created by iPhone on 12/1/18.
//  Copyright © 2018 iPhone. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var textFieldCorreo: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnIngresarClick(_ sender: Any) {
        let correo: String! = textFieldCorreo.text
        let password: String! = textFieldPassword.text
        
        if correo.isEmpty || password.isEmpty {
            showMessageBox(title: "Error", message: "Falta uno o mas parametros")
        }
        else {
            if datosValidos(correo: correo, password: password) {
                iniciarSesion()
            } else {
                showMessageBox(title: "Error", message: "Usuario y/o password incorrecto")
            }
        }
        
    }
    
    func iniciarSesion() {
        UserDefaults.standard.set(true, forKey: "userLogged")
        self.dismiss(animated: true, completion: nil)
    }
    
    func showMessageBox(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alertController.addAction(UIAlertAction(title: "Cerrar", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func datosValidos(correo: String, password: String) -> Bool {
        let userEmail: String = UserDefaults.standard.string(forKey: "userEmail")!
        let userPassword: String = UserDefaults.standard.string(forKey: "userPassword")!
        if correo == userEmail && password == userPassword {
            return true
        }
        return false
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
