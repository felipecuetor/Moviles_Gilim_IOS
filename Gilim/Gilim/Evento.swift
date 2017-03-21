//
//  Evento.swift
//  Gilim
//
//  Created by ANDRES ZULETA on 21/02/17.
//  Copyright © 2017 isis3510. All rights reserved.
//

import UIKit

class Evento: NSObject {
    
    var id:Int!
    var nombre:String?
    var precio: Int?
    var lugar: String?
    var imagen: String?

    override init() {
        super.init()
    }
    
    convenience init(_ dictionary : Dictionary<String,AnyObject>){
        self.init()
        
        id = dictionary["id"] as! Int
        nombre = dictionary["nombre"] as? String
        precio = dictionary["precio"] as? Int
        lugar = dictionary["lugar"] as? String
        imagen = dictionary["imagen"] as? String
    }
}
