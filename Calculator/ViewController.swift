//
//  ViewController.swift
//  Calculator
//
//  Created by Range, Noah H on 10/23/19.
//  Copyright © 2019 Range, Noah H. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var previous: UILabel!
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
    @IBOutlet weak var carrot: UIButton!
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var decimal: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    var currPlaceValue:Int = 0
    var decimalOn = false
    var negative = false
    var lastOp:Character = Character(" ")
    var prevNum:Double = 0{
        willSet{
            previous.text = ""
        }didSet{
            previous.text = String(prevNum)
        }
    }
    var currAns:Double = 0{
        willSet{
            answer.text = String(currAns)
        }didSet{
            if !decimalOn{
                answer.text = String(Int(currAns))
            }else{
            answer.text = String(currAns)
            }
        }
    }
    
    //negative numbers denote values below ones place-value
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if let u = sender.titleLabel?.text{
            switch(u){
            case "+":
                print("+")
                transfer()
                lastOp = Character("+")
            case "-":
                print("-")
                transfer()
                lastOp = Character("-")
            case "Clear":
                doubleClear()
                print("Clear")
            case "%":
                print("%")
                transfer()
                lastOp = Character("%")
            case "±":
                print("±")
                lastOp = Character("±")
            case ".":
                print(".")
                if decimalOn{
                    answer.text = "ERROR"
                    print("ERROR")
                }else{
                    decimalOn.toggle()
                }
            case "÷":
                print("÷")
                transfer()
                lastOp = Character("÷")
            case "X":
                print("X")
                transfer()
                lastOp = Character("X")
            case "=":
                print("=")
                doCalc()
            default:
                print("Something isn't hooked up or the more likely thing it's a number")
                let num = Int(u) ?? 0
                createNumber(number : num)
            }
        }
        
    }
    
    func transfer(){
        prevNum = currAns
        clear()
    }
    
    func createNumber(number : Int){
        if decimalOn{
            currAns += Double(number)/pow(10,Double(currPlaceValue))
            currPlaceValue += 1
        }else{
            currAns = (currAns*10) + Double(number)
        }
        
    }
    
    func clear(){
        decimalOn = false
        negative = false
        currAns = 0
        currPlaceValue = 0
    }
    
    func doubleClear(){
        clear()
        prevNum = 0
        previous.text = ""
    }
    
    func doCalc(){
        var numAns:Double = 0
        switch lastOp{
        case "+":
            numAns = prevNum+currAns
        case "-":
            numAns = prevNum-currAns
        case "%":
            print("not ready for Calculator")
        case "÷":
            numAns = prevNum/currAns
        case "X":
            numAns = prevNum*currAns
        default:
            print("Something is wrong in the doCalc function")
        }
        doubleClear()
        currAns = numAns
    }
    

}

