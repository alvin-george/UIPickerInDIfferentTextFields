//
//  ThirdViewController.swift
//  multiple picker textfield
//
//  Created by apple on 03/07/17.
//  Copyright © 2017 Apoorv Mote. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var sampleTableView: UITableView!
    
    var bottomMenuPicker : BottomMenuPickerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
      //  makeBottomMenuPicker()
    }
    func makeBottomMenuPicker()
    {
       
        bottomMenuPicker = BottomMenuPickerView()
        bottomMenuPicker?.pickerViewItems = ["2","3","4"]
        bottomMenuPicker?.frame =  CGRect(x: 0, y:  self.view.frame.origin.y - self.view.frame.size.height, width: self.view.frame.size.width, height: self.view.frame.size.height/3)
        
        self.view.addSubview(bottomMenuPicker!)
    }
    //sample TableView
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "sampleTableCell")! as! SampleTableCell
        
        cell.titleTextField.delegate =  self
        cell.titleTextField.inputView = bottomMenuPicker
        
        return cell
        
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        makeBottomMenuPicker()
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
