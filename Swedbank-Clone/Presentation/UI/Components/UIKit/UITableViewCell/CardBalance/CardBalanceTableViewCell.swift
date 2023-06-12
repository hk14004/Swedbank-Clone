//
//  CardBalanceTableViewCell.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 12/06/2023.
//

import UIKit

class CardBalanceTableViewCell: UITableViewCell {

    static let reuseID = String(describing: CardBalanceTableViewCell.self)
    @IBOutlet weak var cardLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
