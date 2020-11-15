//
//  CustReview.swift
//  Thingy
//
//  Created by Sam Howard on 9/27/20.
//  Copyright © 2020 Sam Howard. All rights reserved.
//

import UIKit
import RealmSwift

class CustReview: UIViewController {

    @IBOutlet var setControl: UISegmentedControl!
    @IBOutlet var custTextView: UITextView!
    var st1 = "Good"
    let realm = try! Realm()
    var temp: String?
    
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

    @IBAction func segTapped(_ sender: UISegmentedControl) {
        switch setControl.selectedSegmentIndex {
        case 0:
            st1 = "Good"
        case 1:
            st1 = "Bad"
        case 2:
            st1 = "Neutral"
        default:
            st1 = "Neutral"
        }
    }
    
    func save() {
        let customerPost = Data()
        customerPost.u1post = temp!
        customerPost.state = st1
        realm.beginWrite()
        realm.add(customerPost)
        try! realm.commitWrite()
    }
    @IBAction func postTapped(_ sender: UIButton) {
        temp = custTextView.text
        save()
    }
}
