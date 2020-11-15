//
//  BusLogin.swift
//  Thingy
//
//  Created by Sam Howard on 10/25/20.
//  Copyright © 2020 Sam Howard. All rights reserved.
//

import UIKit
import RealmSwift
class BusLogin: UIViewController {

    @IBOutlet var Ubuslogin: UITextField!
    @IBOutlet var PWbuslogin: UITextField!
    @IBOutlet var UbusSignup: UITextField!
    @IBOutlet var PWbusSignup: UITextField!
    
    var bulog: String?
    var bpwlog: String?
    var busign: String?
    var bpwsign: String?
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
    
    func save() {
        let businessAccountData = BusinessAccount()
        businessAccountData.businessUserLog = bulog!
        businessAccountData.businessPwLog = bpwlog!
        businessAccountData.businessUserSign = busign!
        businessAccountData.businessPwSign = bpwsign!
        realm.beginWrite()
        realm.add(businessAccountData)
        try! realm.commitWrite()
    }
    
    @IBAction func enterPressed(_ sender: UIButton) {
        bulog = Ubuslogin.text
        bpwlog = PWbuslogin.text
        busign = UbusSignup.text
        bpwsign = PWbusSignup.text
        save()
    }
}
