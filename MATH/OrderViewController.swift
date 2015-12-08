//
//  ViewController.swift
//  OrderFormCalc
//
//  Created by Ivo Radoslavov on 12/1/15.
//  Copyright © 2015 Ivo Radoslavov. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var itemThreeTextField: UITextField!
    @IBOutlet weak var itemTwoTextField: UITextField!
    @IBOutlet weak var itemOneTextField: UITextField!
    @IBOutlet weak var quantityOne: UITextField!
    @IBOutlet weak var priceOne: UITextField!
    @IBOutlet weak var quantityTwo: UITextField!
    @IBOutlet weak var priceTwo: UITextField!
    @IBOutlet weak var quantityThree: UITextField!
    @IBOutlet weak var priceThree: UITextField!
    @IBOutlet weak var totalOne: UILabel!
    @IBOutlet weak var totalTwo: UILabel!
    @IBOutlet weak var totalThree: UILabel!
    @IBOutlet weak var ExtraChargeLabel: UITextField!
    @IBOutlet weak var subTotalLabel: UILabel!
    @IBOutlet weak var taxLabel: UILabel!
    @IBOutlet weak var shippingTextField: UITextField!
    @IBOutlet weak var grandTotalLable: UILabel!
    
    func calculateOne() -> Double {
        var qOne = Double(quantityOne.text!)
        if qOne == nil {qOne = 0}
        
        var pOne = Double(priceOne.text!)
        if pOne == nil {pOne = 0}
        
        let result = qOne! * pOne!
        return result
    }
    
    func calculateTwo() -> Double {
        var qTwo = Double(quantityTwo.text!)
        if qTwo == nil {qTwo = 0}
        
        var pTwo = Double(priceOne.text!)
        if pTwo == nil {pTwo = 0}
            
        let result = qTwo! * pTwo!
        return result
    }
    
    func calculateThree() -> Double {
        var qThree = Double(quantityThree.text!)
        if qThree == nil {qThree = 0}
        
        var pThree = Double(priceThree.text!)
        if pThree == nil {pThree = 0}
        
        let result = qThree! * pThree!
        return result
    }
    
    func calculateSubTotal() -> Double {
        var extraCharge = Double(ExtraChargeLabel.text!)
        if extraCharge == nil {extraCharge = 0}
        let result = calculateOne() + calculateTwo() + calculateThree() + extraCharge!
        return result
    }
    
    func calculateTax() -> Double {
        let result = calculateSubTotal() * 0.08875
        return result
    }
    
    func calculateGrandTotal() -> Double {
        var tax = Double(taxLabel.text!)
        if tax == nil {tax = 0}
        
        var shippingCharge = Double(shippingTextField.text!)
        if shippingCharge == nil {shippingCharge = 0}
        
        let result = calculateSubTotal() + tax! + shippingCharge!
        return result
    }
    
    @IBAction func calculateAll(sender: AnyObject) {
        totalOne.text = String(round(calculateOne()*100)/100)
        totalTwo.text = String(round(calculateTwo()*100)/100)
        totalThree.text = String(round(calculateThree()*100)/100)
        subTotalLabel.text = String(round(calculateSubTotal()*100)/100)
        grandTotalLable.text = String(round(calculateGrandTotal()*100)/100)
    }
    
    @IBAction func calculateTax(sender: UISwitch) {
        if sender.on {
            taxLabel.text = String(round(calculateTax()*100)/100)
            calculateAll(UISwitch)
        } else {
            taxLabel.text = String(0.0)
            
            let grandTotal = calculateGrandTotal() + calculateTax()
            
            let tax = calculateTax()
            
            let result = grandTotal - tax
            
            grandTotalLable.text = String(result)
        }

    }
    @IBAction func clearAll(sender: AnyObject) {
        itemThreeTextField.text = ""
        itemTwoTextField.text = ""
        itemOneTextField.text = ""
        quantityOne.text = ""
        priceOne.text = ""
        quantityTwo.text = ""
        priceTwo.text = ""
        priceThree.text = ""
        quantityThree.text = ""
        totalOne.text = ""
        totalTwo.text = ""
        totalThree.text = ""
        ExtraChargeLabel.text = ""
        subTotalLabel.text = ""
        taxLabel.text = ""
        shippingTextField.text = ""
        grandTotalLable.text = ""
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        
        grandTotalLable.layer.borderWidth = 5.0
        grandTotalLable.layer.borderColor = UIColor.blueColor().CGColor
        
        totalOne.layer.borderWidth = 2.0
        
        totalTwo.layer.borderWidth = 2.0
        
        totalThree.layer.borderWidth = 2.0
        
        self.quantityOne.delegate = self
        self.quantityTwo.delegate = self
        self.quantityThree.delegate = self
        self.priceOne.delegate = self
        self.priceTwo.delegate = self
        self.priceThree.delegate = self
        self.ExtraChargeLabel.delegate = self
        self.shippingTextField.delegate = self
        self.itemOneTextField.delegate = self
        self.itemTwoTextField.delegate = self
        self.itemThreeTextField.delegate = self
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

