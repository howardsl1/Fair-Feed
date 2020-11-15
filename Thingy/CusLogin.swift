//
//  CusLogin.swift
//  Thingy
//
//  Created by Sam Howard on 10/25/20.
//  Copyright © 2020 Sam Howard. All rights reserved.
//

import UIKit
import RealmSwift

class CusLogin: UIViewController {

    @IBOutlet var UcusLogin: UITextField!
    @IBOutlet var PWcusLogin: UITextField!
    @IBOutlet var UcusSignup: UITextField!
    @IBOutlet var PWcusSignup: UITextField!
    var culog: String?
    var cpwlog: String?
    var cusign: String?
    var cpwsign: String?
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        print(Realm.Configuration.defaultConfiguration.fileURL)
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
        let cusLoginData = CustomerAccount()
        cusLoginData.customerUserLog = culog!
        cusLoginData.customerPwLog = cpwlog!
        cusLoginData.customerUserSign = cusign!
        cusLoginData.customerPwSign = cpwsign!
        realm.beginWrite()
        realm.add(cusLoginData)
        try! realm.commitWrite()
    }
    
    @IBAction func enterPressed(_ sender: UIButton) {
        culog = UcusLogin.text
        cpwlog = PWcusLogin.text
        cusign = UcusSignup.text
        cpwsign = PWcusSignup.text
        save()
    }
}
