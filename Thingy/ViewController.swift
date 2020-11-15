//
//  ViewController.swift
//  Thingy
//
//  Created by Sam Howard on 8/25/20.
//  Copyright © 2020 Sam Howard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Customer View Text Fields
    @IBOutlet weak var CustUlog: UITextField!
    @IBOutlet weak var CustPlog: UITextField!
    
    @IBOutlet weak var CustUsign: UITextField!
    @IBOutlet weak var CustPsign: UITextField!
    
    //Business View Text Fields
    @IBOutlet weak var BusUlog: UITextField!
    @IBOutlet weak var BusPlog: UITextField!
    
    @IBOutlet weak var BusUsign: UITextField!
    @IBOutlet weak var BusPsign: UITextField!
    //Go to Bus Review
    @IBAction func enter(_ sender: UIButton) {
    }
    
    //viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        
        
        
    }
    //Was commented
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func enterTapped(_ sender: Any) {
        
    }
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if ((notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y = 0
            }
        }
    }
    
}
