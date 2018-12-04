//
//  Mascota.swift
//  MascotaSaludable
//
//  Created by iPhone on 12/2/18.
//  Copyright © 2018 iPhone. All rights reserved.
//

import Foundation
import UIKit

//class Mascota: NSObject, NSCoding {
class Mascota {
    
    //MARK: atributos
    
    // MARK: Archiving Paths
//    static var DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
//    static var ArchiveURL = DocumentsDirectory.appendPathComponent("mascotas")
    var nombre: String
    var foto: UIImage?
    var fechaNacimiento: String
    var propietario: String
    var peso: String
    var comentarios: String
    
    // MARK: Types
/*    struct PropertyKey {
        static let nameKey = "nombre"
        static let photoKey = "foto"
        static let dateKey = "fechaNacimiento"
        static let propKey = "propietario"
        static let weightKey = "peso"
        static let commentsKey = "comentarios"
    }
*/
    init(nombre: String, foto: UIImage?, fechaNacimiento: String, propietario: String, peso: String, comentarios: String) {
        self.nombre = nombre
        self.foto = foto
        self.fechaNacimiento = fechaNacimiento
        self.propietario = propietario
        self.peso = peso
        self.comentarios = comentarios
    }
    
    func actualizarComentarios(comentarioNuevo: String) {
        self.comentarios = comentarioNuevo
    }
/*
    // MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(nombre, forKey: PropertyKey.nameKey)
        aCoder.encode(foto, forKey: PropertyKey.photoKey)
        aCoder.encode(fechaNacimiento, forKey: PropertyKey.dateKey)
        aCoder.encode(propietario, forKey: PropertyKey.propKey)
        aCoder.encode(peso, forKey: PropertyKey.weightKey)
        aCoder.encode(comentarios, forKey: PropertyKey.commentsKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let nombre = aDecoder.decodeObject(forKey: PropertyKey.nameKey) as! String
        let foto = aDecoder.decodeObject(forKey: PropertyKey.photoKey) as? UIImage
        let fecha = aDecoder.decodeObject(forKey: PropertyKey.dateKey) as! String
        let propietario = aDecoder.decodeObject(forKey: PropertyKey.propKey) as! String
        let peso = aDecoder.decodeObject(forKey: PropertyKey.weightKey) as! String
        let comentarios = aDecoder.decodeObject(forKey: PropertyKey.commentsKey) as! String
        
        self.init(nombre: nombre, foto: foto, fechaNacimiento: fecha, propietario: propietario, peso: peso, comentarios: comentarios)
        
    }
  */
}
