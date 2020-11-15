//
//  Data.swift
//  Thingy
//
//  Created by Sam Howard on 10/19/20.
//  Copyright © 2020 Sam Howard. All rights reserved.
//

import Foundation
import RealmSwift

class Data: Object {
    @objc dynamic var u1post: String = ""
    @objc dynamic var state: String = ""
    @objc dynamic var businessResp: String = ""
    @objc dynamic var businessRev: String = ""
}

class Data2: Object {
    @objc dynamic var businessResp: String = ""
    @objc dynamic var businessRev: String = ""
}

class CustomerAccount: Object {
    @objc dynamic var customerUserLog: String = ""
    @objc dynamic var customerPwLog: String = ""
    @objc dynamic var customerUserSign: String = ""
    @objc dynamic var customerPwSign: String = ""
}

class BusinessAccount: Object {
    @objc dynamic var businessUserLog: String = ""
    @objc dynamic var businessPwLog: String = ""
    @objc dynamic var businessUserSign: String = ""
    @objc dynamic var businessPwSign: String = ""
}

class Disputed: Object {
    @objc dynamic var disputedAlert: Bool = false
}
