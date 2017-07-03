//
//  PickerViewController.swift
//  PickerView
//
//  Created by iOS Developer on 12/9/16.
//  Copyright © 2016 Chantier. All rights reserved.
//

import UIKit
import CoreData

protocol UIPickerControllerDataDelegate {
    func getPickerData (selectedIndex : Int , selectedItem : String?)
}
class PickerViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var pickerViewItems: [String]?
    var doneButtonClick:((_ selectedIndex: Int)->Void)!
    var selectedIndex: Int = 0
    
    var currentViewController : String =  String()
    var targetViewController :UIViewController?
    
    var delegate:UIPickerControllerDataDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate =  self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if let item = pickerViewItems {
            return item.count
        }
        return 0
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if let item = pickerViewItems {
            return item[row]
        }
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedIndex = row
    }
    
    @IBAction func doneButtonClicked(_ sender: AnyObject) {
        
        DispatchQueue.main.async {
            self.delegate.getPickerData(selectedIndex: self.selectedIndex, selectedItem: self.pickerViewItems?[self.selectedIndex])
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonClicked(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func cancelPicker(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func donePicker(_ sender: Any) {
        DispatchQueue.main.async {
            self.delegate.getPickerData(selectedIndex: self.selectedIndex, selectedItem: self.pickerViewItems?[self.selectedIndex])
        }
        self.dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

