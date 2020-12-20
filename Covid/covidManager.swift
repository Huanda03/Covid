//
//  covidManager.swift
//  Covid
//
//  Created by Mac2 on 20/12/20.
//  Copyright © 2020 Mac2. All rights reserved.
//

import Foundation

protocol covidManagerDelegate {
    func actualizarDatos(covid : CovidModelo)
}

struct covidManager {
    
    var delegado : covidManagerDelegate?
    
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
                    if let covid = self.parseJSON(covidData: datosSeguros){
                        self.delegado?.actualizarDatos(covid: covid)
                    }
                }
            }
            tarea.resume()
        }

    }
    
    func parseJSON (covidData : Data) -> CovidModelo?{
        let decoder = JSONDecoder()
        do{
            let dataDecodificada = try decoder.decode(CovidData.self, from: covidData)
            let totales = dataDecodificada.cases
            let muertes = dataDecodificada.deaths
            let recuperados = dataDecodificada.recovered
            let bandera = dataDecodificada.countryInfo.flag
            let objCovid = CovidModelo(totales: totales, muertes: muertes, recuperados: recuperados, bandera: bandera)
            return objCovid
        }catch{
            print(error)
            return nil
        }
    }
    
}
