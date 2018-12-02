//
//  Mascota.swift
//  MascotaSaludable
//
//  Created by iPhone on 12/2/18.
//  Copyright © 2018 iPhone. All rights reserved.
//

import Foundation
import UIKit

class Mascota {
    
    //MARK: atributos
    var nombre: String
    var foto: UIImage?
    var fechaNacimiento: String
    var propietario: String
    var peso: String
    var comentarios: String
    
    init(nombre: String, foto: UIImage?, fechaNacimiento: String, propietario: String, peso: String, comentarios: String) {
        self.nombre = nombre
        self.foto = foto
        self.fechaNacimiento = fechaNacimiento
        self.propietario = propietario
        self.peso = peso
        self.comentarios = comentarios
    }
}
