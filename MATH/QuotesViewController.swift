//
//  ViewController.swift
//  Quotes
//
//  Created by Ivo Radoslavov on 11/13/15.
//  Copyright © 2015 Ivo Radoslavov. All rights reserved.
//

import UIKit

class QuotesViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var unitTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var screenTextField: UITextField!
    @IBOutlet weak var shippingTextField: UITextField!
    @IBOutlet weak var taxLabel: UILabel!
    @IBOutlet weak var perUnitLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    func calculateTax() -> Double {
        var unit = Double(unitTextField.text!)
        if unit == nil {unit = 0}
        
        var q = Double(quantityTextField.text!)
        if q == nil {q = 0}
        
        var screen = Double(screenTextField.text!)
        if screen == nil {screen = 0}
        
        let result = (unit! * q! + screen!) * 0.08875
        
        return result
    }
    
    func calculateTotal() -> Double {
        var unit = Double(unitTextField.text!)
        if unit == nil {unit = 0}
        
        var q = Double(quantityTextField.text!)
        if q == nil {q = 0}
        
        var screen = Double(screenTextField.text!)
        if screen == nil {screen = 0}
        
        var shipping = Double(shippingTextField.text!)
        if shipping == nil {shipping = 0}
        
        var tax = Double(taxLabel.text!)
        if tax == nil {tax = 0}
        
        let result = (unit! * q!) + screen! + shipping! + tax!
        
        return result
    }
    
    func calculatePerUnit() -> Double {
        let total = calculateTotal()
        
        var q = Double(quantityTextField.text!)
        if q == nil {q = 0}
        
        let result = total / q!
        
        return result
    }
    
    @IBAction func calculate(sender: AnyObject) {
        taxLabel.text! = String(round(calculateTax()*100)/100)
        totalLabel.text! = String(round(calculateTotal()*100)/100)
        perUnitLabel.text! = String(round(calculatePerUnit() * 100)/100)
        let priceAlert = UIAlertController(title: perUnitLabel.text!, message: "is the unit price", preferredStyle: UIAlertControllerStyle.Alert)
        priceAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(priceAlert, animated: true, completion: nil)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func clearAll(sender: AnyObject) {
        unitTextField.text = ""
        quantityTextField.text = ""
        screenTextField.text = ""
        shippingTextField.text = ""
        taxLabel.text = ""
        perUnitLabel.text = ""
        totalLabel.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        totalLabel.layer.borderWidth = 2.0
        totalLabel.layer.cornerRadius = 8
        
        perUnitLabel.layer.borderWidth = 2.0
        perUnitLabel.layer.cornerRadius = 8
        
        taxLabel.layer.borderWidth = 2.0
        taxLabel.layer.cornerRadius = 8
        
        self.unitTextField.delegate = self
        self.quantityTextField.delegate = self
        self.screenTextField.delegate = self
        self.shippingTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

