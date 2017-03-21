//
//  AsistirEventoViewController.swift
//  Gilim
//
//  Created by ANDRES ZULETA on 21/02/17.
//  Copyright © 2017 isis3510. All rights reserved.
//

import UIKit
import AFNetworking

class AsistirEventoViewController: UIViewController {
    
    var eventoSeleccionado: Evento!
    
    @IBOutlet weak var textoNombre: UITextField!
    
    @IBOutlet weak var textoCantidad: UITextField!
    
    @IBAction func botonAsistir(_ sender: Any) {
        if textoNombre.text == nil || textoNombre.text == "" {
            showAlert(title: "Nombre Vacio", message: "Debe agregar un nombre para realizar el pedido", closeButtonTitle: "Cerrar")
            return
        }
        
        if textoCantidad.text == nil || textoCantidad.text == "" {
            showAlert(title: "Cantidad Vacia", message: "Debe especificar la cantidad que va a reservar", closeButtonTitle: "Cerrar")
            return
        }
        
        let params: [String:Any] = [
            "eventoId":String(eventoSeleccionado.id),
            "cliente":textoNombre.text!,
            "cantidad":textoCantidad.text!
        ]
        
        manager.requestSerializer = AFJSONRequestSerializer()
        manager.post("/reservas", parameters: params, progress: { (progress) in
        
        }, success: { (task: URLSessionDataTask, response) in
            
            let dictionaryResponse: NSDictionary = response! as! NSDictionary
            
            let alertController = UIAlertController(title: "Reserva Exitoso",
                                                    message: dictionaryResponse["msg"] as? String, preferredStyle: .alert)
            
            let volverAction = UIAlertAction(title: "Volver a eventos", style:
            .default) { (action: UIAlertAction) in
                self.dismiss(animated: true, completion: nil)
            }
            alertController.addAction(volverAction)
            
            self.present(alertController, animated: true) {
            }
            
        }) { (task: URLSessionDataTask?, error: Error) in
            
            self.showAlert(title: "Error en la solicitud", message:
                error.localizedDescription, closeButtonTitle: "Cerrar")
        }
        
    }
    
    @IBAction func botonCerrarVentana(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showAlert(title:String, message:String, closeButtonTitle:String) {
        
        let alertController = UIAlertController(title: title, message: message,
                                                preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: closeButtonTitle, style:
        .default) { (action: UIAlertAction) in
            //Ejecutar algún código al pulsar esta opción.
        }
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true) {
            
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
