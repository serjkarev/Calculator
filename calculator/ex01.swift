//
//  ex01.swift
//  calculator
//
//  Created by Serhii KAREV on 4/2/19.
//  Copyright © 2019 Serhii KAREV. All rights reserved.
//

import UIKit

class ex01: UIViewController{
    
    @IBOutlet weak var label_ex01: UILabel!
    
    @IBAction func wasd(_ sender: UIButton) {
        label_ex01.text = "Hello World !"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
