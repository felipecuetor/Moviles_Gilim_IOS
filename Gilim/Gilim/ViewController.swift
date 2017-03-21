//
//  ViewController.swift
//  Gilim
//
//  Created by ANDRES ZULETA on 20/02/17.
//  Copyright © 2017 isis3510. All rights reserved.
//

import UIKit
import AFNetworking
import Contacts
import ContactsUI

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CNContactPickerDelegate {

    @IBOutlet weak var eventosTableView:UITableView!
    @IBOutlet weak var loadingSpinner:UIActivityIndicatorView!
    //Definicion e inicialización de un arreglo en swift 3
    var arregloEventos:[String] = [String]()
    var eventos:[Evento] = [Evento]()
    var SwiftTimer = Timer()
    @IBOutlet weak var botonCerrarV: UIBarButtonItem!
    @IBOutlet weak var compartir: UIButton!
    
    let contactPicker: CNContactPickerViewController = CNContactPickerViewController()
  
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactPicker.delegate=self;
        
        loadingSpinner.startAnimating()
        SwiftTimer = Timer.scheduledTimer(timeInterval: 3.0, target:self, selector: #selector(getEventos), userInfo: nil, repeats: false)
        
        // Do any additional setup after loading the view, typically from a nib.
        arregloEventos.append("New Eve Rock")
        arregloEventos.append("Protozoo en la hamburguesería")
        arregloEventos.append("Festival Estereo Picnic")
        arregloEventos.append("Rock al parque")
        arregloEventos.append("Tomorrowland")
        print("Los eventos son: \(arregloEventos)")
        
          //Declaración de los delagados y dataSource
        eventosTableView.delegate = self
        eventosTableView.dataSource = self
        eventosTableView.rowHeight=150;
        getEventos()
        
        loadingSpinner.stopAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Este es para la guia 3
        //return arregloEventos.count
        
        //Este es para la guia 4
        return eventos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Lógica para la guia 3
        
        //Dentro de esta variable se encuentra la celda que hemos definido anteriormente
       //--let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier:"CellEvento")!
        //Asignamos el texto correspondiente a la celda
       //--cell.textLabel!.text = arregloEventos[indexPath.row]
        
        
        //Dentro de esta variable se encuentra la celda que hemos definido anteriormente
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier:"CellEvento2")!
        
        //Obtenemos el evento en la posicion actual
        let eventoActual:Evento = eventos[indexPath.row]
        
        //Obtenemos con el tag una referencia a la imagen que se va a agregar a la vista (cell)
        let imageView: UIImageView = cell.viewWithTag(1) as! UIImageView
        imageView.setImageWith(URL(string:eventoActual.imagen!)!)
        
        //Hacemos lo anterior pero para el nombre
        let nombreCell: UILabel = cell.viewWithTag(2) as! UILabel
        nombreCell.text = eventoActual.nombre!
        
        //Hacemos lo anterior pero para el lugar
        let lugarCell: UILabel = cell.viewWithTag(3) as! UILabel
        lugarCell.text = eventoActual.lugar!
        
        //Hacemos lo anterior pero para el precio
        let precioCell: UILabel = cell.viewWithTag(4) as! UILabel
        precioCell.text = String(eventoActual.precio!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("se seleccionó una celda en la posición: \(indexPath.row)")
        
        //Corresponde a la guia de trabajo 3
        //self.performSegue(withIdentifier:"GoToDetalleEvento", sender: arregloEventos[indexPath.row])
        
        //corresponde a la guia 4
        let eventoSeleccionado:Evento = eventos[indexPath.row]
        
        //Imprimimos lo guardado en nuestra variable global
        GlobalVariables.sharedInstance.ultimoElementoSeleccionado = eventoSeleccionado
        print(GlobalVariables.sharedInstance.ultimoElementoSeleccionado!.nombre!)
        
        self.performSegue(withIdentifier:"segue2", sender: eventoSeleccionado)
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToDetalleEvento"{
            let controladorDestino = segue.destination as! DetalleEventoViewController
            controladorDestino.textoTitulo = sender as? String
        }
        
        else if segue.identifier == "segue2"{
            let viewController: AsistirEventoViewController = segue.destination as!
            AsistirEventoViewController
            viewController.eventoSeleccionado = sender as? Evento
        }
    }
    
    func getEventos(){
        
        
        manager.get("/eventos", parameters: nil, progress: {(progress) in
            }, success: { (task: URLSessionDataTask, response) in
                let arrayResponse : NSArray = response! as! NSArray
                
                for item in arrayResponse {
                    let eventoActual: Evento = Evento(item as! Dictionary<String,
                        AnyObject>)
                    self.eventos.append(eventoActual)
                    self.eventosTableView.reloadData()
                }
                
                print(arrayResponse)
        } ) { (task: URLSessionDataTask?, error:Error) in
            print("Error task: \(task) -- Error response:  \(error)")
        
        }
        
    }
    
    

    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
    }
    
    
    @IBAction func cerrar(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewWillAppear(_ animated: Bool)
    {
        print("ViewWillAppear Invocado")
    }
    override func viewWillLayoutSubviews()
    {
        print("ViewWillLayoutSubviews Invocado")
    }
    override func viewDidLayoutSubviews()
    {
        print("ViewDidLayoutSubviews Invocado")
    }
    override func viewDidAppear(_ animated: Bool)
    {
        print("ViewDidAppear Invocado")
    }
    override func viewWillDisappear(_ animated: Bool)
    {
        print("ViewWillDisappear Invocado")
    }
    override func viewDidDisappear(_ animated: Bool)
    {
        print("ViewDidDissapear Invocado")
    }
    


}

