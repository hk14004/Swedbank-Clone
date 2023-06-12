//
//  OverviewScreenVC.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 12/06/2023.
//

import UIKit

class OverviewScreenVC: UIViewController {
    
    // MARK: Properties
    
    let viewModel: any OverviewScreenVM
    
    // MARK: Init
    
    init(viewModel: any OverviewScreenVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
