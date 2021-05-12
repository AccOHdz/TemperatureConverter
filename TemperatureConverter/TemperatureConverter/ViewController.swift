//
//  ViewController.swift
//  TemperatureConverter
//
//  Created by osmar.alan.hernandez on 06/05/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var fahrenheitValue: Measurement<UnitTemperature>? {
        didSet {
            updateLabel()
        }
    }
    
    var celsiusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func textDidChange(_ sender: UITextField) {
        if let text = sender.text, let value = Double(text) {
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
        }
    }
    
    @IBAction func userDidTap(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
    
    private func updateLabel() {
        if let celsisuValue = celsiusValue {
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsisuValue.value))
        } else {
            celsiusLabel.text = "???"
        }
    }
}
