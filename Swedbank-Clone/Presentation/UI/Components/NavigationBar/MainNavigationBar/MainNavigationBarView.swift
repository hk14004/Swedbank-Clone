//
//  MainNavigationBarView.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 12/06/2023.
//

import UIKit
import DevToolsUI
import DevToolsCore
import DevToolsLocalization

class MainNavigationBarView: UIView, StoryboardLoadableView {
    
    // MARK: Properties
    
    @IBOutlet weak var buttonStackView: UIStackView!
    @IBOutlet weak var titleLabelView: RuntimeLocalizedLabel!
    var loadedXibView: UIView!
    private var itemBuilder: ((UIStackView)->())?
    
    // MARK: Init
    
    override func awakeFromNib() {
        super.awakeFromNib()
        buttonStackView.subviews.forEach({$0.removeFromSuperview()})
        itemBuilder?(buttonStackView)
    }
    
}

// MARK: Public

extension MainNavigationBarView {
    func populateStackView(itemBuilder: @escaping (UIStackView)->()) {
        buttonStackView.subviews.forEach({$0.removeFromSuperview()})
        self.itemBuilder = itemBuilder
    }
}
