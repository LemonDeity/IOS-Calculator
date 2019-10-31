//
//  ViewController.swift
//  Calculator
//
//  Created by Range, Noah H on 10/23/19.
//  Copyright © 2019 Range, Noah H. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var numB: [UIButton]!
    @IBOutlet var operationB: [UIButton]!
    @IBOutlet weak var previous: UILabel!
    @IBOutlet weak var answer: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    var currPlaceValue:Int = 1
    var decimalOn = false
    var negative = false
    var lastOp:Character = Character(" ")
    var display:Bool = false
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
            if display{
                answer.text = String(currAns)
            }else{
                if decimalOn{
                    answer.text = String(currAns)
                }else{
                    answer.text = String(Int(currAns))
                }
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
                currAns *= -1
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
            currAns = Double(currAns*10) + Double(number)
        }
        
    }
    
    func clear(){
        decimalOn = false
        negative = false
        currAns = 0.0
        currPlaceValue = 1
        display = false
    }
    
    func doubleClear(){
        clear()
        prevNum = 0.0
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
        if checkIfWhole(number: numAns){
            display = false
        }else{
            display = true
        }
        currAns = numAns
        print(currAns)
    }
    
    func checkIfWhole(number: Double) -> Bool{
        let num:Int = Int(number)
        return number-Double(num)==0 ? true : false
    }
    

}

