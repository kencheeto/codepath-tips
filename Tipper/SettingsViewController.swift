//
//  SettingsViewController.swift
//  Tipper
//
//  Created by Kenshiro Nakagawa on 2/1/15.
//  Copyright (c) 2015 Kenshiro Nakagawa. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var tipOptions = []
    
    @IBOutlet weak var defaultTipPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        defaultTipPicker.delegate = self
        defaultTipPicker.dataSource = self
        tipOptions = [0.18, 0.20, 0.22]
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tipOptions.count
    }
    
    func pickerView(pickerView: UIPickerView!, titleForRow row: Int, forComponent component: Int) -> String! {
        return "\(tipOptions[row])"
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(row, forKey: "defaultTip")
        defaults.synchronize()
    }
}