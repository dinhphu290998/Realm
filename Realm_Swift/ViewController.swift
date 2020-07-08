//
//  ViewController.swift
//  Realm_Swift
//
//  Created by NDPhu on 7/7/20.
//  Copyright © 2020 IOS_Team. All rights reserved.
//

import UIKit
import Kingfisher
class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var listBooks = [Book]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }

    override func viewWillAppear(_ animated: Bool) {
        self.fetchBooks()
    }
    
    func fetchBooks() {
        self.listBooks = RealmManager.shared.getObjects(type: Book.self) ?? []
        self.tableView.reloadData()
    }
    @IBAction func showDetail(_ sender: UIButton) {
        self.check = false
        self.performSegue(withIdentifier: "showdetail", sender: nil)
    }
    var index = 0
    var check = false
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! DetailViewController
        if check == true {
            vc.book = listBooks[index]
            vc.check = check
        } else {
            vc.check = check
        }
    }
}

extension ViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listBooks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.nameLb.text = listBooks[indexPath.row].name
        cell.codeLb.text = listBooks[indexPath.row].code
        cell.authorLb.text = listBooks[indexPath.row].author
        cell.numberLb.text = listBooks[indexPath.row].number
        cell.typeLb.text = listBooks[indexPath.row].type
        cell.imageBookView.kf.setImage(with: URL.init(string: listBooks[indexPath.row].urlImage))
        cell.imageBookView.layer.cornerRadius = 5
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.index = indexPath.row
        self.check = true
        self.performSegue(withIdentifier: "showdetail", sender: nil)
    }
}
