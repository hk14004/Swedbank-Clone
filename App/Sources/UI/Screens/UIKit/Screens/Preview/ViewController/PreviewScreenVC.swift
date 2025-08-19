//
//  PreviewScreenVC.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 29/04/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import UIKit
import Combine

class PreviewScreenVC: UIViewController {
    // MARK: Types
    enum PreviewLayout {
        case center
        case edges
    }
    
    // MARK: Properties
    private var previewView: UIView
    private var layout: PreviewLayout
    
    // MARK: Lifecycle
    override func loadView() {
        super.loadView()
        setup()
    }
    
    init(previewView: UIView, layout: PreviewLayout) {
        self.previewView = previewView
        self.layout = layout
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    private func setup() {
        view.backgroundColor = .systemBackground
        view.addSubview(previewView)
        previewView.snp.makeConstraints { make in
            switch layout {
            case .center:
                make.center.equalToSuperview()
            case .edges:
                make.edges.equalToSuperview()
            }
        }
    }
}
