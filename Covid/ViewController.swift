//
//  ViewController.swift
//  Covid
//
//  Created by Mac2 on 18/12/20.
//  Copyright © 2020 Mac2. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let CovidManager = covidManager()

    @IBOutlet weak var buscarTextField: UITextField!
    @IBOutlet weak var muertesLabel: UILabel!
    @IBOutlet weak var totalesLabel: UILabel!
    @IBOutlet weak var recuperadosLabel: UILabel!
    @IBOutlet weak var flagImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        buscarTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        CovidManager.fetchCovid(nombreCiudad: buscarTextField.text!)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if buscarTextField.text != "" {
            
            return true
        }else {
            buscarTextField.placeholder = "Ingrese un pais"
            return false
        }
    }
    

    @IBAction func buscarButton(_ sender: UIButton) {
        CovidManager.fetchCovid(nombreCiudad: buscarTextField.text!)
    }
}

