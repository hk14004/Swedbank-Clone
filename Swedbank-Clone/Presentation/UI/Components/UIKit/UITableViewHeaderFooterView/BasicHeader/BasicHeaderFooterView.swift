//
//  BasicHeaderFooterView.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 21/06/2023.
//

import UIKit
import DevToolsLocalization

class BasicHeaderFooterView: UITableViewHeaderFooterView {

    static let reuseID = "BasicHeaderFooterView"
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    @IBOutlet weak var titleLabel: RuntimeLocalizedLabel!
}
