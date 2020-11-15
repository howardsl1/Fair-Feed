//
//  BusReview.swift
//  Thingy
//
//  Created by Sam Howard on 9/27/20.
//  Copyright © 2020 Sam Howard. All rights reserved.
//

import UIKit
import RealmSwift

class BusReview: UIViewController {

    @IBOutlet var response: UITextView!
    @IBOutlet var cusReview: UITextView!
    let realm = try! Realm()
    var bRev: String?
    var bResp: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Realm.Configuration.defaultConfiguration.fileURL)
       
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
        let businessPost = Data2()
        businessPost.businessResp = bResp!
        businessPost.businessRev = bRev!
        realm.beginWrite()
        realm.add(businessPost)
        try! realm.commitWrite()
    }
    
    @IBAction func postTapped(_ sender: UIButton) {
        bResp = response.text
        bRev = cusReview.text
        save()
    }
    
}
