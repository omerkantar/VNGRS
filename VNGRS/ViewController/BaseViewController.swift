//
//  BaseViewController.swift
//  VNGRS
//
//  Created by omer kantar on 30.10.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit

// MARK: - View Model Injector
protocol ViewModelInjector {
    associatedtype ViewModel
    var viewModel: ViewModel? { set get }
}

// MARK: - Router Data Source Injector
// Router ile gelen data inject edilecek
protocol RouterDataSourceInjector {
    associatedtype DataSource
    func configuration(dataSource: DataSource) -> Void
}



class BaseViewController: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        designingNavigationBar()
    }
    
    // MARK:
    
}

// MARK: - NavigationBar Design
extension BaseViewController {
    // true ise background color .clear olacak
    @objc func isShowingNavigationBar() -> Bool {
        return false
    }
    
    @objc func getNavigationBarTitle() -> String? {
        return nil
    }
    
    @objc func navigationBarBackgroundColor() -> UIColor? {
        return .clear
    }
    
    func designingNavigationBar() {
        let backgroundColor: UIColor = isShowingNavigationBar() ? navigationBarBackgroundColor() ?? .clear : .clear
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.backIndicatorImage = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.backgroundColor = backgroundColor
        self.navigationController?.navigationBar.tintColor = UIColor.blue
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

