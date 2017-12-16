//
//  EasyTableView.swift
//  EasyTableView
//
//  Created by Matan Cohen on 12/15/17.
//  Copyright © 2017 Matan. All rights reserved.
//

import Foundation
import UIKit

protocol EasyTableViewType {
    init(tableConfiguration: EasyTableConfigurationType)
}

class EasyTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    private let customCellIdentifier = "customCellIdentifier"
    private let tableConfiguration: EasyTableConfigurationType
    
    init(tableConfiguration: EasyTableConfigurationType){
        self.tableConfiguration = tableConfiguration
        super.init(frame: .zero, style: .plain)
        self.delegate = self
        self.dataSource = self
        self.register(tableConfiguration.cellType, forCellReuseIdentifier: tableConfiguration.cellIdentifier())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableConfiguration.dataSourceCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.tableConfiguration.cellIdentifier()) else {
            return UITableViewCell()
        }
        return self.tableConfiguration.configureCell(cell, indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tableConfiguration.cellHeight
    }
}
