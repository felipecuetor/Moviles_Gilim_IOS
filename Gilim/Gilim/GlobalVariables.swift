//
//  GlobalVariables.swift
//  Gilim
//
//  Created by Felipe Cueto Ramirez on 3/10/17.
//  Copyright © 2017 isis3510. All rights reserved.
//

import Foundation
//Generamos un isngleton

class GlobalVariables: NSObject {
    var ultimoElementoSeleccionado: Evento? = nil
    static let sharedInstance = GlobalVariables()
    
    //Garantizamos que sea un singleton
    private override init(){}
}
