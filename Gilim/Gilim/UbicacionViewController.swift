//
//  UbicacionViewController.swift
//  Gilim
//
//  Created by Felipe Cueto Ramirez on 3/16/17.
//  Copyright © 2017 isis3510. All rights reserved.
//

import UIKit
import CoreLocation
import MobileCoreServices

class UbicacionViewController: UIViewController, CLLocationManagerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    var locationManager: CLLocationManager = CLLocationManager();
    var userLocation: CLLocation!
    @IBOutlet weak var imagenUsuario: UIImageView!

    @IBOutlet weak var lblUbicacion: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        userLocation = nil

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var camara: UIButton!
    
    @IBOutlet weak var galeria: UIButton!
    
    
    @IBAction func abrirCamara(_ sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(
            UIImagePickerControllerSourceType.camera) {
            let imagePicker = UIImagePickerController()
            
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func abrirGaleria(_ sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(
            UIImagePickerControllerSourceType.savedPhotosAlbum) {
            let imagePicker = UIImagePickerController()
            
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true,completion:nil)
            
        }
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let mediaType = info[UIImagePickerControllerMediaType] as! NSString
        self.dismiss(animated: true, completion: nil)
        if mediaType.isEqual(to: kUTTypeImage as String) {
            let image = info[UIImagePickerControllerOriginalImage]
                as! UIImage
            imagenUsuario.image = image
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var cerrar: UIBarButtonItem!
    
    @IBAction func cerrarVentana(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let latestLocation: CLLocation = locations[locations.count - 1]
        if userLocation == nil { userLocation = latestLocation
        }
        lblUbicacion.text=(String(userLocation.coordinate.latitude) + "," + String(userLocation.coordinate.longitude));
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location Manager Error: " + error.localizedDescription)
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
