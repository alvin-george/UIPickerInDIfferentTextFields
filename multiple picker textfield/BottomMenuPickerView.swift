//
//  BottomMenuPickerView.swift
//  multiple picker textfield
//
//  Created by apple on 03/07/17.
//  Copyright © 2017 Apoorv Mote. All rights reserved.
//

import UIKit

class BottomMenuPickerView: UIPickerView,UIPickerViewDelegate,UIPickerViewDataSource {

    var pickerViewItems: [String]?
    var doneButtonClick:((_ selectedIndex: Int)->Void)!
    var selectedIndex: Int = 0
    
    var currentViewController : String =  String()
    var targetViewController :UIViewController?
    
    //var delegate:UIPickerControllerDataDelegate!
   
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    
    override func draw(_ rect: CGRect) {
        
        self.frame  =  CGRect(x: 0, y:  screenHeight - (screenHeight/3) , width: screenWidth, height: screenHeight/3)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor =  UIColor.lightGray
        delegate =  self
        
        showsSelectionIndicator = true
        dataSource = self
        
        let toolbarContainerView = UIView(frame: CGRect(x: 0, y: self.frame.origin.y, width: screenWidth, height: 40))
        
        let doneButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 40))
        doneButton.titleLabel?.text =  "DONE"
        doneButton.addTarget(self, action: #selector(BottomMenuPickerView.donePicker), for: .touchUpInside)
        doneButton.titleLabel?.textColor = UIColor.white
        
        toolbarContainerView.addSubview(doneButton)
        
        toolbarContainerView.backgroundColor =  UIColor.clear
        
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.darkGray
        toolBar.sizeToFit()
        toolBar.isUserInteractionEnabled =  true
       
        
        
        let doneBarButton  = UIBarButtonItem(title: "Done", style: .done, target: toolBar, action: nil)
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: toolBar, action: "donePicker")
        
        toolBar.setItems([cancelButton, spaceButton, doneBarButton], animated: false)
        cancelButton.isEnabled = true
        toolBar.isUserInteractionEnabled = true
        
        //toolbarContainerView.addSubview(toolBar)
        addSubview(toolbarContainerView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let attributedString = NSAttributedString(string: (pickerViewItems?[row])!, attributes: [NSForegroundColorAttributeName : UIColor.white])
        return attributedString
    }
    func donePicker()
    {
        print("done clcike")
        self.removeFromSuperview()
    }
   
}
