//
//  DetalleEventoViewController.swift
//  Gilim
//
//  Created by ANDRES ZULETA on 21/02/17.
//  Copyright © 2017 isis3510. All rights reserved.
//

import UIKit

class DetalleEventoViewController: UIViewController {

    
    @IBOutlet weak var labelTitulo: UILabel!
    
    var textoTitulo : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        labelTitulo.text = textoTitulo
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        

    }
    
    @IBAction func cerrarVentana(_ sender: Any) {
        self.dismiss(animated: true){
            
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

}
