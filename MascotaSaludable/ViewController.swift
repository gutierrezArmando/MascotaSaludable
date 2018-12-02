//
//  ViewController.swift
//  MascotaSaludable
//
//  Created by iPhone on 11/23/18.
//  Copyright © 2018 iPhone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var menuView: UIView!
    
    
    var menuShowing : Bool = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        menuView.layer.shadowOpacity = 1
        menuView.layer.shadowRadius = 6
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    @IBAction func pressAccessButton(_ sender: Any) {
        
        if txtUsuario.text == txtPassword.text {
            let alertController = UIAlertController(title: "iOScreator", message:
                "Hello, world!", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)        }
    }*/
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let userLogged: Bool = UserDefaults.standard.bool(forKey: "userLogged")
        if !userLogged {
            self.performSegue(withIdentifier: "viewLogin", sender: self)
        }
    }
    
    
    @IBAction func openCloseMenu(_ sender: Any) {
        
        leadingConstraint.constant = menuShowing ? -229: 0
        menuShowing = !menuShowing
        
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        })
    }
}

