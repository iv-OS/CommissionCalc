//
//  ViewController.swift
//  MATH
//
//  Created by Ivo Radoslavov on 11/11/15.
//  Copyright © 2015 Ivo Radoslavov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
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
    
    //calculates the unit price according to the reference price and the discount
    @IBAction func calculateUnitPrice(sender: AnyObject) {
        let referencePrice = Double(reference.text!)
        let codeDiscount = Double(code.text!)
        let result = referencePrice! - (referencePrice! * (codeDiscount!*0.01))
        referenceUnit.text = String(result)
    }
    
    //calculates the company cost
    func calculateCompanyCost() -> Double {
        var unitPrice = Double(unit.text!)
        if unitPrice == nil {
            unitPrice = 0
        }
        var q = Double(quantity.text!)
        if q == nil {
            q = 0
        }
        var screenH = Double(screenHouse.text!)
        if screenH == nil {
            screenH = 0
        }
        var shipC = Double(shipCo.text!)
        if shipC == nil {
            shipC = 0
        }
        let result = unitPrice! * q! + screenH! + shipC!
        return result
    }
    
    //calculates the subTotal
    func calculateSubTotal() -> Double {
        var unitSold = Double(priceSold.text!)
        if unitSold == nil {
            unitSold = 0
        }
        var q = Double(quantity.text!)
        if q == nil {
            q = 0
        }
        var scrn = Double(screenCharged.text!)
        if scrn == nil {
            scrn = 0
        }
        let result = unitSold! * q! + scrn!
        return result
    }
    
    //calculates the tax
    func calculateTax()->Double {
        let result = calculateSubTotal() * 0.08875
        return result
    }
    
    func calculateTotalCost()->Double {
        var unitPrice = Double(unit.text!)
        if unitPrice == nil {
            unitPrice = 0
        }
        var q = Double(quantity.text!)
        if q == nil {
            q = 0
        }
        var screenH = Double(screenHouse.text!)
        if screenH == nil {
            screenH = 0
        }
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
        let result = (q! * unitPrice!) + screenH! + (houseCost! * q!) + shipC! + shipCost! + taxCost!
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
        var q = Double(quantity.text!)
        if q == nil {
            q = 0
        }
        var scrn = Double(screenCharged.text!)
        if scrn == nil {
            scrn = 0
        }
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
        if actualUnitLabel == nil {
            actualUnitLabel = 0
        }
        let totalCost = calculateTotalCost()
        let profit = calculateProfit()
        
        
        
    }
    
    @IBAction func calculateAll(sender: AnyObject) {
        companyCost.text = String(calculateCompanyCost())
        subTotalLabel.text = String(calculateSubTotal())
        taxLabel.text = String(calculateTax())
        totalCostLabel.text = String(calculateTotalCost())
        profitLabel.text = String(calculateProfit())
        commissionLabel.text = String(calculateCommission())
        actualUnitLabel.text = String(calculateActualUnit())
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

