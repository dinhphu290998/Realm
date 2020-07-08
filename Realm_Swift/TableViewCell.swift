//
//  TableViewCell.swift
//  Realm_Swift
//
//  Created by NDPhu on 7/7/20.
//  Copyright © 2020 IOS_Team. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var typeLb: UILabel!
    @IBOutlet weak var numberLb: UILabel!
    @IBOutlet weak var authorLb: UILabel!
    @IBOutlet weak var codeLb: UILabel!
    @IBOutlet weak var nameLb: UILabel!
    @IBOutlet weak var imageBookView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
