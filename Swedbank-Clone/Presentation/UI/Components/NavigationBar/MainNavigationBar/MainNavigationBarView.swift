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
    
    @IBOutlet private weak var buttonStackView: UIStackView!
    @IBOutlet private weak var titleLabelView: RuntimeLocalizedLabel!
    var loadedXibView: UIView!
    private var itemBuilder: ((UIStackView)->())?
    var runtimeLocalizedTitleKey: String = ""
    
    // MARK: init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonXibInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonXibInit()
    }
    
}

// MARK: Public

extension MainNavigationBarView {
    func populateStackView(itemBuilder: @escaping (UIStackView)->()) {
        buttonStackView.subviews.forEach({$0.removeFromSuperview()})
        self.itemBuilder = itemBuilder
    }
    
    func updateTitle(key: String) {
        titleLabelView.localizedStringKey = key
    }
    
    func viewDidLoad() {
        titleLabelView.textColor = Asset.Colors.headlineText.color
        titleLabelView.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    }
}
