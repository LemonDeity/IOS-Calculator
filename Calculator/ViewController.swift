//
//  ViewController.swift
//  Calculator
//
//  Created by Range, Noah H on 10/23/19.
//  Copyright © 2019 Range, Noah H. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var b0: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b9: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var flipSign: UIButton!
    @IBOutlet weak var modulus: UIButton!
    @IBOutlet weak var divide: UIButton!
    @IBOutlet weak var multiply: UIButton!
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var decimal: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answer.text = ""
    }
    
    
   
    @IBAction func buttonPressed(_ sender: UIButton) {
        
    }
    

}

