//
//  LugaresViewController.swift
//  Gilim
//
//  Created by Felipe Cueto Ramirez on 3/16/17.
//  Copyright © 2017 isis3510. All rights reserved.
//

import UIKit
import Contacts
import ContactsUI

class LugaresViewController: UIViewController, UITableViewDelegate, CNContactPickerDelegate{
    @IBOutlet weak var cerrarLugares: UIBarButtonItem!
    
    let contactPicker: CNContactPickerViewController = CNContactPickerViewController()

    @IBOutlet weak var compartir: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactPicker.delegate = self

        // Do any additional setup after loading the view.
    }
    
    
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        print(contact)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cerrarLugaresAccion(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
