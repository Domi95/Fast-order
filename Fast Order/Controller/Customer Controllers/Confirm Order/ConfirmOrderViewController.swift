//
//  ConfirmOrderViewController.swift
//  Fast Order
//
//  Created by Domagoj Beronic on 11/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit
import FirebaseDatabase

protocol UpdateDataFromConfirmOrderVC {
    func updateDataInTableView(order: Order)
    func resetTableViewData()
}

class ConfirmOrderViewController: UIViewController {
    var updateDataDelagate: UpdateDataFromConfirmOrderVC!
    let confirmOrderView = ConfirmOrderView()
    var order: Order!
    let services = Services()
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        setUpElements()
        setUpNavigationBar()
        setUpButtonsAction()
        setUpTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        confirmOrderView.tableView.reloadData()
        self.confirmOrderView.confirmOrderButton.setTitle("Narući \(self.order.beveragesCounter) za \(self.order.beveragesPriceSum) Kn", for: .normal)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if self.isMovingFromParent {
            //User  can add or subtract beverages in ConfirmOrderVC and if he presses back button,
            //with this method we will send new result of beverages to the MenuViewController
            updateDataDelagate.updateDataInTableView(order: self.order)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    private func setUpButtonsAction(){
        confirmOrderView.confirmOrderButton.addTarget(self, action: #selector(confirmOrderButtonPressed), for: .touchUpInside)
    }
    
    //When user presses plus icon for specific beverage, this method will do appropriate visual changes on cell
    //Is called by "plusImageTapped"
    private func changeCellAppereanceAfterPlusIsTapped(indexPath: IndexPath, plusImageRecognizer: MyTapGesture){
        if let cell = self.confirmOrderView.tableView.cellForRow(at: indexPath) as? ConfirmOrderCell {
            cell.plusImageTapped(order: order, tapGesture: plusImageRecognizer)
            self.confirmOrderView.plusTapped(beveragesCounter: self.order.beveragesCounter, beveragesPriceCounter: self.order.beveragesPriceSum)
        }
    }
    
    //When user presses minus icon for specific beverage, this method will do appropriate visual changes on cell
    //Is called by "minusImageTapped"
    private func changeCellAppereanceAfterMinusIsTapped(indexPath: IndexPath, minusImageRecognizer: MyTapGesture){
        if let cell = self.confirmOrderView.tableView.cellForRow(at: indexPath) as? ConfirmOrderCell {
            cell.minusImageTapped(order: order, tapGesture: minusImageRecognizer)
            self.confirmOrderView.minusTapped(beveragesCounter: self.order.beveragesCounter, beveragesPriceCounter: self.order.beveragesPriceSum)
        }
    }
    
    @objc func confirmOrderButtonPressed(){
        services.postOrderIntoFirebase(order: self.order)
        self.order.beveragesCounter = 0
        updateDataDelagate.updateDataInTableView(order: self.order)
        self.navigationController?.pushViewController(successfulOrderViewController, animated: true)
    }
    
    //Changes data of the variables after user clicked plusImage to add beverage
    @objc func plusImageTapped(plusImageRecognizer: MyTapGesture){
        self.order.beveragesCounter += 1
        self.order.beveragesPriceSum += order.beverages[plusImageRecognizer.row].price
        order.beverages[plusImageRecognizer.row].beverageCounter += 1
        let indexPath = IndexPath(row: plusImageRecognizer.row, section: plusImageRecognizer.section)
        changeCellAppereanceAfterPlusIsTapped(indexPath: indexPath, plusImageRecognizer: plusImageRecognizer)
    }
    
    //Changes data of the variables after user clicked minusImage to subtract beverage
    @objc func minusImageTapped(minusImageRecognizer: MyTapGesture){
        self.order.beveragesCounter -= 1
        self.order.beveragesPriceSum -= order.beverages[minusImageRecognizer.row].price
        let indexPath = IndexPath(row: minusImageRecognizer.row, section: minusImageRecognizer.section)
        if order.beverages[minusImageRecognizer.row].beverageCounter > 0 {
            self.order.beverages[minusImageRecognizer.row].beverageCounter -= 1
        }
        changeCellAppereanceAfterMinusIsTapped(indexPath: indexPath, minusImageRecognizer: minusImageRecognizer)
    }
    
    private func setUpNavigationBar(){
        self.navigationController?.navigationBar.backItem?.title = "La Bodega"
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    private func setUpTableView() {
        confirmOrderView.tableView.dataSource = self
        confirmOrderView.tableView.delegate = self
        confirmOrderView.tableView.register(UINib(nibName: Constants.confirmOrderCell, bundle: nil), forCellReuseIdentifier: Constants.confirmOrderCell)
    }
    
    private func setUpElements(){
        view.addSubview(confirmOrderView)
        confirmOrderView.translatesAutoresizingMaskIntoConstraints = false
        confirmOrderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        confirmOrderView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        confirmOrderView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        confirmOrderView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        confirmOrderView.confirmOrderButton.setTitle("Narući \(order.beveragesCounter) za \(order.beveragesPriceSum) Kn", for: .normal)
    }
}

extension ConfirmOrderViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.order.beverages.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.confirmOrderView.tableView.dequeueReusableCell(withIdentifier: Constants.confirmOrderCell, for: indexPath) as! ConfirmOrderCell
        cell.setUpCell(order: order, indexPath: indexPath)
        
        let plusImageRecognizer = MyTapGesture(target: self, action: #selector(plusImageTapped(plusImageRecognizer:)))
        plusImageRecognizer.row = indexPath.row
        plusImageRecognizer.section = indexPath.section
        
        let minusImageRecognizer = MyTapGesture(target: self, action: #selector(minusImageTapped(minusImageRecognizer:)))
        minusImageRecognizer.row = indexPath.row
        minusImageRecognizer.section = indexPath.section
        
        cell.plusImageView.isUserInteractionEnabled = true
        cell.plusImageView.addGestureRecognizer(plusImageRecognizer)
        cell.minusImageView.isUserInteractionEnabled = true
        cell.minusImageView.addGestureRecognizer(minusImageRecognizer)
        return cell
    }
}

extension ConfirmOrderViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
    }
}

