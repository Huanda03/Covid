//
//  covidManager.swift
//  Covid
//
//  Created by Mac2 on 20/12/20.
//  Copyright © 2020 Mac2. All rights reserved.
//

import Foundation

struct covidManager {
    let covidURL = "https://corona.lmao.ninja/v3/covid-19/countries/"
    
    func fetchCovid (nombreCiudad: String) {
        let urlString = "\(covidURL)\(nombreCiudad)"
        realizarSolicutud(urlString: urlString)
        print(urlString)
    }
    func realizarSolicutud (urlString: String){
        if let url = URL (string: urlString){
            let session = URLSession(configuration: .default)
            let tarea = session.dataTask(with: url) { (data, respuesta, error) in
                if error != nil{
                    print(error!)
                    return
                }
                if let datosSeguros = data{
                    self.parseJSON(covidData: datosSeguros)
                }
            }
            tarea.resume()
        }

    }
    
    func parseJSON (covidData : Data){
        let decoder = JSONDecoder()
        do{
            let dataDecodificada = try decoder.decode(CovidData.self, from: covidData)
            print(dataDecodificada.cases)
        }catch{
            print(error)
        }
    }
    
}
