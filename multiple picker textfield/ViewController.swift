//
//  ViewController.swift
//  multiple picker textfield


import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let iPhones = ["iPhone 6s", "iPhone 6s Plus", "iPhone SE"]
    
    let colors = ["Gold", "Rose Gold", "Silver", "Space Gray"]
    
    @IBOutlet weak var iPhoneTextField: UITextField!
    
    @IBOutlet weak var colorTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let iPhonePickerView = UIPickerView()
        iPhonePickerView.delegate = self
        iPhonePickerView.tag = 1
        iPhoneTextField.inputView = iPhonePickerView
        let colorPickerView = UIPickerView()
          colorPickerView.delegate = self
         colorPickerView.tag = 2
         colorTextField.inputView = colorPickerView
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 1 {
            
            return iPhones.count
            
        }
        
        if pickerView.tag == 2 {
            
            return colors.count
            
        }
        
        return 0
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 1 {
            
            return iPhones[row]
            
        }
        
        if pickerView.tag == 2 {
            
            return colors[row]
            
        }
        
        return nil
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView.tag == 1 {
            
            iPhoneTextField.text = iPhones[row]
            
        }
        
        if pickerView.tag == 2 {
            
            colorTextField.text = colors[row]
            
        }
    }
    
    
    
}

