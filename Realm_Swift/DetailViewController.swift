//
//  DetailViewController.swift
//  Realm_Swift
//
//  Created by NDPhu on 7/7/20.
//  Copyright © 2020 IOS_Team. All rights reserved.
//

import UIKit
import Kingfisher
import RealmSwift

class DetailViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var numberTF: UITextField!
    @IBOutlet weak var typeTF: UITextField!
    @IBOutlet weak var authorTF: UITextField!
    @IBOutlet weak var codeTF: UITextField!
    @IBOutlet weak var nameTF: UITextField!
    var book: Book?
    var check = false
    var id: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        if let book = self.book, check == true {
            nameTF.text = book.name
            typeTF.text = book.type
            authorTF.text = book.author
            codeTF.text = book.code
            numberTF.text = book.number
            image.kf.setImage(with: URL.init(string: book.urlImage))
            image.layer.cornerRadius = 5
            self.id = book.idBook
            self.book = book
        } else {
            nameTF.text = ""
            typeTF.text = ""
            authorTF.text = ""
            codeTF.text = ""
            numberTF.text = ""
            image.image = nil
            image.layer.cornerRadius = 5
        }
    }
    
    @IBAction func save(_ sender: UIButton) {
        if check == false {
            let book = Book.init()
            book.name = nameTF.text ?? ""
            book.number = numberTF.text ?? ""
            book.type = typeTF.text ?? ""
            book.author = authorTF.text ?? ""
            book.code = codeTF.text ?? ""
            book.idBook = UUID().uuidString
            book.urlImage = listURLStringImages.randomElement() ?? ""
            RealmManager.shared.saveObject(objs: book)
            self.navigationController?.popViewController(animated: true)

        } else {
            let realm = try! Realm()
            guard let book = self.book else {return}
            try! realm.write({
                book.name = nameTF.text ?? ""
                book.number = numberTF.text ?? ""
                book.type = typeTF.text ?? ""
                book.author = authorTF.text ?? ""
                book.code = codeTF.text ?? ""
            })
            self.navigationController?.popViewController(animated: true)
        }
    }

    @IBAction func deleteObject(_ sender: UIButton) {
        let realm = try! Realm()
        guard let book = self.book else {return}
        try! realm.write({
            realm.delete(book)
        })
        self.navigationController?.popViewController(animated: true)
    }
    
}
