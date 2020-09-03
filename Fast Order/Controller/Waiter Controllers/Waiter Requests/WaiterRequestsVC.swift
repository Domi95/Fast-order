//
//  RequestWaiterCallsViewController.swift
//  Fast Order Waiter App
//
//  Created by Domagoj Beronic on 14/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit

class WaiterRequestsViewController: UIViewController {
    
    let waiterRequestsView = WaiterRequestsView()
    let services = WaiterService()
    var tableNumber: String!
    var timeStamp: String! {
        didSet {
            setUpTableView()
            waiterRequestsView.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        setUpWaiterMenuView()
        setUpNavigationBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        services.getAndObserverWaiterCalls { (waiterRequest) in
            self.tableNumber = waiterRequest.tableNumber
            self.timeStamp = waiterRequest.timeStamp
        }
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setUpNavigationBar(){
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.topItem?.title = "Waiter requests"
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: "Arial-BoldItalicMT", size: 28)!
        ]
    }
    
    private func setUpTableView() {
        waiterRequestsView.tableView.dataSource = self
        waiterRequestsView.tableView.delegate = self
        waiterRequestsView.tableView.register(UINib(nibName: Constants.waiterRequestCell, bundle: nil), forCellReuseIdentifier: Constants.waiterRequestCell)
    }
    
    private func setUpWaiterMenuView(){
        view.addSubview(waiterRequestsView)
        waiterRequestsView.translatesAutoresizingMaskIntoConstraints = false
        waiterRequestsView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        waiterRequestsView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        waiterRequestsView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        waiterRequestsView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension WaiterRequestsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
       
    }
}

extension WaiterRequestsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.waiterRequestsView.tableView.dequeueReusableCell(withIdentifier: Constants.waiterRequestCell, for: indexPath) as! WaiterRequestCell
        cell.setUp(table: self.tableNumber, time: self.timeStamp)
        cell.selectionStyle = .none
        return cell
    }
    
}
