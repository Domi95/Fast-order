//
//  WaiterMenuViewController.swift
//  fastOrder
//
//  Created by Domagoj Beronic on 26/07/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit

class OrderListVC: UIViewController {
    let services = Services()
    let orderListView = OrderListView()
    var orderedBeverages = [Beverage]()
    var orders = [Order]() {
        didSet {
            self.orderListView.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        self.navigationItem.hidesBackButton = true
        setUpTableView()
        setUpOrderListView()
        fillTableView()
        setUpNavigationBar()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        orderListView.tableView.reloadData()
    }
    
    private func fillTableView() {
        services.getAndObserveFirebaseOrders(completion: { (ordersFromFirebase) in
            self.orders = ordersFromFirebase
        })
    }
    
    private func setUpNavigationBar(){
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.topItem?.title = Constants.coffeBarName
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: "Arial-BoldItalicMT", size: 28)!
        ]
    }
    
    private func setUpTableView() {
        orderListView.tableView.dataSource = self
        orderListView.tableView.delegate = self
        orderListView.tableView.register(UINib(nibName: Constants.orderListCell, bundle: nil), forCellReuseIdentifier: Constants.orderListCell)
    }
    
    private func setUpOrderListView() {
        view.addSubview(orderListView)
        orderListView.translatesAutoresizingMaskIntoConstraints = false
        orderListView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        orderListView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        orderListView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        orderListView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension OrderListVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.orders.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.orderListView.tableView.dequeueReusableCell(withIdentifier: Constants.orderListCell, for: indexPath) as! OrderListCell
        cell.setUp(order: orders[indexPath.row], indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            services.removeOrderFromFirebase(orderId: orders[indexPath.row].id)
            orders.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .bottom)
        }
    }
}

extension OrderListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let waiterOrderViewController = OrderDetailsViewController(orders: self.orders, selectedOrderNumber: indexPath.row)
       if let cell = self.orderListView.tableView.cellForRow(at: indexPath) as? OrderListCell {
        self.orders[indexPath.row].seenBoolean = true
        cell.changeSeenImage()
        }
        self.navigationController?.pushViewController(waiterOrderViewController, animated: true)
    }
}
