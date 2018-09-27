//
//  ViewController.swift
//  shopinglist1.2
//
//  Created by Ernesto Pang on 9/22/18.
//  Copyright © 2018 Ernesto Pang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource , UITableViewDelegate, transferirDatos{
    
    
    func transferir(nombre: String, precio: Double, infomacion: String,cantidad: Int) {
        if carrito.count == 0 {
            carrito.append(Productos(nombre: nombre, precio: precio, informacion: infomacion, cantidad: cantidad))
        }else{
            var i = 0
            for item in carrito{
                if item.nombre == nombre{
                    carrito[i].cantidad = item.cantidad + cantidad
                    i = -1
                    break
                }
                i += 1
            }
            if i != -1{
                carrito.append(Productos(nombre: nombre, precio: precio, informacion: infomacion, cantidad: cantidad))
            }
        }
        
        
    }
    
    
    
    @IBOutlet weak var tabla: UITableView!
    var shopinglist = [Productos]()
    var carrito = [Productos]()
    override func viewDidLoad() {
        super.viewDidLoad()
        shopinglist.append(Productos(nombre: "Nave espacial", precio: 1000, informacion: "Nave espacial con capacidad de viajes interdimencionales", cantidad: 0))
        shopinglist.append(Productos(nombre: "Computadora cuantica", precio: 799.99, informacion: "Computadora que usa cubits en lugar de bits", cantidad: 0))
        shopinglist.append(Productos(nombre: "Kriptonita", precio: 10000, informacion: "Super eficiente para matar super hombres de acero", cantidad: 0))
        shopinglist.append(Productos(nombre: "Corazon", precio: 599.99, informacion: "Util para la morra fria que no tiene sentimientos", cantidad: 0))
        shopinglist.append(Productos(nombre: "Piedra filosofal", precio: 99999.99, informacion: "?????", cantidad: 0))
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func unwindView (segue: UIStoryboardSegue){
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shopinglist.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda" ,for: indexPath)
        cell.textLabel?.text = shopinglist[indexPath.row].nombre
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "secondView"{
            let indexPath = tabla.indexPathForSelectedRow
            let destination = segue.destination as! SecondViewController
            destination.shopinglist2 = shopinglist
            destination.datos = (indexPath?.row)!
            destination.delegate = self//.datos = shopinglist[(indexPath?.row)!].informacion
            //destination.shopinglist2 = shopinglist
            //destination.delegate = self
        }
        if segue.identifier == "thirdView"{
            let destination2 = segue.destination as! ThirdViewController
            destination2.carrito2 = carrito
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        // Dispose of any resources that can be recreated.
    }
    
    
}

