//
//  SecondViewController.swift
//  shopinglist1.2
//
//  Created by Ernesto Pang on 9/22/18.
//  Copyright © 2018 Ernesto Pang. All rights reserved.
//

import UIKit
protocol transferirDatos {
    func transferir(nombre: String, precio: Double, infomacion: String,cantidad: Int)
}

class SecondViewController: UIViewController {
    
    var delegate : transferirDatos?
    
    
    @IBOutlet weak var label4: UILabel!
    
    @IBAction func compra(_ sender: UIButton) {
        shopinglist2[datos].cantidad = conteo
        //label2.text = "\(shopinglist2[datos].cantidad)"
        delegate?.transferir( nombre: shopinglist2[datos].nombre, precio: shopinglist2[datos].precio, infomacion: shopinglist2[datos].informacion, cantidad: shopinglist2[datos].cantidad)
        label4.text = "Agregado"
    }
    
    @IBAction func mas(_ sender: UIButton) {
        conteo = conteo + 1
        label3.text = "\(conteo)"
    }
    @IBOutlet weak var label3: UILabel!
    
    @IBAction func menos(_ sender: UIButton) {
        conteo = conteo - 1
        label3.text = "\(conteo)"
    }
    
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var label: UILabel!
    var conteo = 0
    var datos: Int = 0
    var shopinglist2 = [Productos]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label3.text = "\(conteo)"
        label2.text = shopinglist2[datos].nombre
        label.text = shopinglist2[datos].informacion
        //shopinglist2[1].nombre = "Perro"
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

