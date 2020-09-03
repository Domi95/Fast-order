//
//  WaiterOrderViewController.swift
//  fastOrder
//
//  Created by Domagoj Beronic on 03/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit

class OrderDetailsViewController: UIViewController {
    let orderView = OrderDetailsView()
    var orders = [Order]()
    var selectedOrderNumber = 0
    
    init(orders: [Order], selectedOrderNumber: Int) {
        super.init(nibName: nil, bundle: nil)
        self.orders = orders
        self.selectedOrderNumber = selectedOrderNumber
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        self.navigationController?.isNavigationBarHidden = false
        setUpTableView()
        setUpWaiteOrderView()
        setUpNavigationBar()
    }
    
    private func setUpNavigationBar(){
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    private func setUpTableView() {
        orderView.tableView.dataSource = self
        orderView.tableView.delegate = self
        orderView.tableView.register(UINib(nibName: Constants.orderDetailsCell, bundle: nil), forCellReuseIdentifier: Constants.orderDetailsCell)
    }
    
    private func setUpWaiteOrderView(){
        orderView.pricesSumLabel.text = "Ukupno: \(self.orders[selectedOrderNumber].beveragesPriceSum)Kn"
        view.addSubview(orderView)
        orderView.translatesAutoresizingMaskIntoConstraints = false
        orderView.topAnchor.constraint(equalTo: view.topAnchor, constant: -1).isActive = true
        orderView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        orderView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        orderView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}


extension OrderDetailsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.orders[self.selectedOrderNumber].beverages.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.orderView.tableView.dequeueReusableCell(withIdentifier: Constants.orderDetailsCell, for: indexPath) as! OrderDetailsCell
        cell.setUp(order: orders[selectedOrderNumber], indexPath: indexPath)
        return cell
    }
}

extension OrderDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
    }
}
