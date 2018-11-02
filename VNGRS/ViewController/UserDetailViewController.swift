//
//  UserDetailViewController.swift
//  VNGRS
//
//  Created by omer kantar on 30.10.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit



class UserDetailViewController: BaseViewController, RouterDataSourceInjector {
    
    
    @IBOutlet weak var tableView: QueerTableView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - RouterDataSourceInjector
    typealias DataSource = UserDetailDataSource
    func configuration(dataSource: UserDetailDataSource) {
        
    }
    


}
