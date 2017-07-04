//
//  SecondViewController.swift
//  multiple picker textfield
//
//  Created by apple on 03/07/17.
//  Copyright © 2017 Apoorv Mote. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UIPickerControllerDataDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var subjectTextField: UITextField!
    @IBOutlet weak var chapterTextField: UITextField!
    
    var selectedOption:String?
    
    
    var bottomMenuPicker : BottomMenuPickerView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
   
        //makeBottomMenuPicker()
        
        
        
    }
    
    func makeBottomMenuPicker()
    {
        
        bottomMenuPicker = BottomMenuPickerView()
        bottomMenuPicker?.pickerViewItems = ["2","3","4"]
        
        subjectTextField.inputAccessoryView =  bottomMenuPicker
        
        self.view.addSubview(bottomMenuPicker!)
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        textField.resignFirstResponder()
        
        switch textField.tag {
        case 0:
            showLacartPickerView(currentViewControllerIdentifier: "secondViewController", pickerViewItems: ["Chemistry","Physics","Maths","English","History"])
        case 1:
            showLacartPickerView(currentViewControllerIdentifier: "secondViewController", pickerViewItems: ["Chapter 1","Chapter 2","Chapter 3","Chapte 4","Chapter 5"])
        default:
            break
        }
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.view.endEditing(true)
        
        if let chosen =  selectedOption{
            switch textField.tag {
            case 0:
                subjectTextField.text =  chosen
            case 1:
                chapterTextField.text =  chosen
            default:
                break
            }
        }
        
        return true
    }
    
    func showLacartPickerView(currentViewControllerIdentifier : String? ,pickerViewItems : [String]?)
    {
        let lacrtPickerView = self.storyboard?.instantiateViewController(withIdentifier: "pickerViewController") as! PickerViewController
        lacrtPickerView.pickerViewItems = pickerViewItems
        lacrtPickerView.currentViewController = currentViewControllerIdentifier!
        lacrtPickerView.delegate =  self
        
        
        lacrtPickerView.modalPresentationStyle = .overCurrentContext
        self.present(lacrtPickerView, animated: true, completion: nil)
        
    }
    //Custom Delegates
    func getPickerData(selectedIndex : Int, selectedItem : String?){
        
        let buttonTitleString: String = "selectedItem :" + selectedItem!+", selectedIndex : " + String(describing: selectedIndex)
        
        selectedOption =  selectedItem
        
        subjectTextField.text =  selectedItem
        
        self.reloadInputViews()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
