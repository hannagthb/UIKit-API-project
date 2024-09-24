//
//  MainVC.swift
//  CryptoCheck
//
//  Created by Hanna Che on 16/09/2024.
//

import UIKit

class MainVC: UIViewController {
    
    var viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
           view.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
           
           viewModel.setView(in: self.view)
           viewModel.setBackground(in: self.view)
           viewModel.setTableView(in: self.view)
           
           viewModel.tableView.dataSource = self
           viewModel.tableView.delegate = self
        
           viewModel.fetchAllData()
       }
}

#Preview {
    MainVC()
}
