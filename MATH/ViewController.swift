//
//  ViewController.swift
//  MATH
//
//  Created by Ivo Radoslavov on 11/11/15.
//  Copyright © 2015 Ivo Radoslavov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var screenHouse: UITextField!
    @IBOutlet weak var priceSold: UITextField!
    @IBOutlet weak var referenceUnit: UILabel!
    @IBOutlet weak var code: UITextField!
    @IBOutlet weak var reference: UITextField!
    @IBOutlet weak var quantity: UITextField!
    @IBOutlet weak var unit: UITextField!
    @IBOutlet weak var screenCharged: UITextField!
    @IBOutlet weak var companyCost: UILabel!
    @IBOutlet weak var charged: UITextField!
    @IBOutlet weak var housePerUnit: UITextField!
    @IBOutlet weak var shipCo: UITextField!
    @IBOutlet weak var shipping: UITextField!
    @IBOutlet weak var taxLabel: UILabel!
    @IBOutlet weak var subTotalLabel: UILabel!
    @IBOutlet weak var totalCostLabel: UILabel!
    @IBOutlet weak var profitLabel: UILabel!
    @IBOutlet weak var commissionLabel: UILabel!
    @IBOutlet weak var actualUnitLabel: UILabel!
    @IBOutlet weak var actualCommissionLabel: UILabel!
    
    var q : Double! = 0.0
    var unitPrice : Double! = 0.0
    var unitSold : Double! = 0.0
    var scrn: Double! = 0.0
    var screenH : Double! = 0.0
    var shipCost : Double! = 0.0
    
    func textFieldDidEndEditing(textField: UITextField) {
        if textField == quantity {
            if let quantityTextField = Double (quantity.text!) {
                q = quantityTextField
            }
        } else if textField == unit {
            if let unitTextField = Double (unit.text!) {
                unitPrice = unitTextField
            }
        } else if textField == priceSold {
            if let priceSoldTextField = Double (priceSold.text!) {
                unitSold = priceSoldTextField
            }
        } else if textField == screenCharged {
            if let screenChargedTextField = Double (screenCharged.text!) {
                scrn = screenChargedTextField
            }
        } else if textField == screenHouse {
            if let screenHouseTextField = Double (screenHouse.text!) {
                screenH = screenHouseTextField
            }
        } else if textField == shipping {
            if let shippingTextField = Double (shipping.text!) {
                shipCost = shippingTextField
            }
        }
    }
    
    //calculates the unit price according to the reference price and the discount
    @IBAction func calculateUnitPrice(sender: AnyObject) {
        let referencePrice = Double(reference.text!)
        let codeDiscount = Double(code.text!)
        let result = referencePrice! - (referencePrice! * (codeDiscount!*0.01))
        referenceUnit.text = String(result)
    }
    
    //calculates the company cost
    func calculateCompanyCost() -> Double {
        
        var shipC = Double(shipCo.text!)
        if shipC == nil {
            shipC = 0
        }
        let result = unitPrice! * q! + screenH! + shipC!
        return result
    }
    
    //calculates the subTotal
    func calculateSubTotal() -> Double {
        let result = unitSold! * q! + scrn!
        return result
    }
    
    //calculates the tax
    func calculateTax()->Double {
        let result = calculateSubTotal() * 0.08875
        return result
    }
    
    func calculateTotalCost()->Double {
  
        var shipC = Double(shipCo.text!)
        if shipC == nil {
            shipC = 0
        }
        var houseCost = Double(housePerUnit.text!)
        if houseCost == nil {
            houseCost = 0
        }
    
        var taxCost = Double(taxLabel.text!)
        if taxCost == nil {
          taxCost = 0
        }
        var shipCost = Double(shipping.text!)
        if shipCost == nil {
            shipCost = 0
        }
        let result = (q! * unitPrice) + screenH! + (houseCost! * q!) + shipC! + shipCost! + taxCost!
        return result
    }
    
    func calculateProfit()->Double {
        var chargedClient = Double(charged.text!)
        if chargedClient == nil {
            chargedClient = 0
        }
        var totalCost = Double(totalCostLabel.text!)
        if totalCost == nil {
            totalCost = 0
        }
        let result = chargedClient! - totalCost!
        return result
    }
    
    func calculateCommission()->Double {
        var profit = Double(profitLabel.text!)
        if profit == nil {
            profit = 0
        }
        let result = profit!/2
        return result
    }
    
    func calculateActualUnit()->Double {
        var houseCost = Double(housePerUnit.text!)
        if houseCost == nil {
            houseCost = 0
        }
        var shipC = Double(shipCo.text!)
        if shipC == nil {
            shipC = 0
        }
        var shipCost = Double(shipping.text!)
        if shipCost == nil {
            shipCost = 0
        }
        var chargedClient = Double(charged.text!)
        if chargedClient == nil {
            chargedClient = 0
        }
        let top = (chargedClient! - (scrn! + (scrn! * 0.08875)) - shipC! - shipCost! - (houseCost! * q!))
        let bottom = q!+(q!*0.08875)
        let result = top/bottom
        return result
    }
    
    func calculateActualComiss() -> Double {
        var actualUnitCharged = Double(actualUnitLabel.text!)
        if actualUnitCharged == nil {
            actualUnitCharged = 0
        }
        var taxCost = Double(taxLabel.text!)
        if taxCost == nil {
            taxCost = 0
        }
        var chargedClient = Double(charged.text!)
        if chargedClient == nil {
            chargedClient = 0
        }

        let subTotal = actualUnitCharged! * q! + scrn!
        let subTotalTax = subTotal * 0.08875
        
        let totalCost = calculateTotalCost() - (taxCost! - subTotalTax)
        let profit = chargedClient! - totalCost
        let comission = profit/2
        
        return comission
    }
    
    func calculateTotalCharged() -> Double {
        return (unitSold * q) + scrn + shipCost
    }
    
    
    
    @IBAction func calculateAll(sender: AnyObject) {
        //charged.text = String(round(calculateTotalCharged() * 100) / 100)
        companyCost.text = String(round(calculateCompanyCost() * 100) / 100)
        subTotalLabel.text = String(round(calculateSubTotal() * 100) / 100)
        taxLabel.text = String(round(calculateTax() * 100) / 100)
        totalCostLabel.text = String(round(calculateTotalCost() * 100) / 100)
        profitLabel.text = String(round(calculateProfit() * 100) / 100)
        commissionLabel.text = String(round(calculateCommission() * 100) / 100)
        actualUnitLabel.text = String(round(calculateActualUnit() * 10000) / 10000)
        actualCommissionLabel.text = String(round(calculateActualComiss() * 100) / 100)
        
        let comissionAlert = UIAlertController(title: actualCommissionLabel.text!, message: "IS THE COMMISSION", preferredStyle: UIAlertControllerStyle.Alert)
        comissionAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(comissionAlert, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    @IBAction func clearAll(sender: AnyObject) {
        quantity.text = ""
        unit.text = ""
        priceSold.text = ""
        screenHouse.text = ""
        referenceUnit.text = ""
        code.text = ""
        reference.text = ""
        companyCost.text = ""
        charged.text = ""
        housePerUnit.text = ""
        shipCo.text = ""
        shipping.text = ""
        taxLabel.text = ""
        subTotalLabel.text = ""
        totalCostLabel.text = ""
        profitLabel.text = ""
        commissionLabel.text = ""
        actualUnitLabel.text = ""
        actualCommissionLabel.text = ""
        screenCharged.text = ""
        q = 0.0
        unitPrice = 0.0
        unitSold = 0.0
        scrn = 0.0
        screenH = 0.0
        
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
        
        companyCost.layer.borderWidth = 2.0
        companyCost.layer.cornerRadius = 8
        
        subTotalLabel.layer.borderWidth = 2.0
        subTotalLabel.layer.cornerRadius = 8
        
        taxLabel.layer.borderWidth = 2.0
        taxLabel.layer.cornerRadius = 8
        
        totalCostLabel.layer.borderWidth = 2.0
        totalCostLabel.layer.cornerRadius = 8
        
        profitLabel.layer.borderWidth = 2.0
        profitLabel.layer.cornerRadius = 8
        
        commissionLabel.layer.borderWidth = 2.0
        commissionLabel.layer.cornerRadius = 8
        
        actualCommissionLabel.layer.borderWidth = 5.0
        actualCommissionLabel.layer.borderColor = UIColor.blueColor().CGColor
        
        referenceUnit.layer.borderWidth = 2.0
        referenceUnit.layer.cornerRadius = 8
        
        actualUnitLabel.layer.borderWidth = 2.0
        actualUnitLabel.layer.cornerRadius = 8
        
        self.reference.delegate = self
        self.code.delegate = self
        self.unit.delegate = self
        self.priceSold.delegate = self
        self.quantity.delegate = self
        self.screenHouse.delegate = self
        self.screenCharged.delegate = self
        self.shipCo.delegate = self
        self.shipping.delegate = self
        self.charged.delegate = self
        self.housePerUnit.delegate = self
    }
    
    func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y -= 200
    }
    func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y += 200
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

