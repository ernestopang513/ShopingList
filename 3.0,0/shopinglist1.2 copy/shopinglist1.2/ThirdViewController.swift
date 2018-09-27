//
//  ThirdViewController.swift
//  shopinglist1.2
//
//  Created by Ernesto Pang on 9/22/18.
//  Copyright © 2018 Ernesto Pang. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label: UILabel!
    
    var carrito2 = [Productos]()

    override func viewDidLoad() {
        super.viewDidLoad()
        var cuenta = 0.0
        label.text = "Carrito"
        if carrito2.count == 0{
            label2.text = "No hay items en el carrito."
        }else{
            for item in carrito2{
                
                cuenta = cuenta + item.precio * Double(item.cantidad)
            }
            label2.text = "Total: $\(cuenta)"
        }
        
        
        //label.text = "\(carrito2[1].cantidad)"
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carrito2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        cell.textLabel?.text = "\(carrito2[indexPath.row].cantidad)" + " " + carrito2[indexPath.row].nombre
        return cell
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
