//
//  Book.swift
//  Realm_Swift
//
//  Created by NDPhu on 7/7/20.
//  Copyright © 2020 IOS_Team. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class Book: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var code: String = ""
    @objc dynamic var idBook: String = ""
    @objc dynamic var author: String = ""
    @objc dynamic var number: String = ""
    @objc dynamic var type: String = ""
    @objc dynamic var urlImage: String = ""
    
}
