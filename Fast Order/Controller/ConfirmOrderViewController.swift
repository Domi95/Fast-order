//
//  ConfirmOrderViewController.swift
//  Fast Order
//
//  Created by Domagoj Beronic on 11/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import Foundation
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
    
    override func viewDidLoad() {
        setUpButtonsAction()
        confirmOrderView.tableView.dataSource = self
        confirmOrderView.tableView.delegate = self
        confirmOrderView.tableView.register(UINib(nibName: "BeverageCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        render()
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
    
    func render(){
        setUpElements()
        setUpNavigationBar()
    }
    
    func setUpNavigationBar(){
        self.navigationController?.navigationBar.backItem?.title = "La Bodega"
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    @objc func confirmOrderButtonPressed(){
       services.postOrderIntoFirebase(order: self.order)
       self.order.beverages = []
       updateDataDelagate.updateDataInTableView(order: self.order)
       self.navigationController?.pushViewController(successfulOrderViewController, animated: true)
    }
    
    func setUpButtonsAction(){
        confirmOrderView.confirmOrderButton.addTarget(self, action: #selector(confirmOrderButtonPressed), for: .touchUpInside)
    }
    
    func setUpElements(){
        view.addSubview(confirmOrderView)
        confirmOrderView.translatesAutoresizingMaskIntoConstraints = false
        confirmOrderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        confirmOrderView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        confirmOrderView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        confirmOrderView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        self.confirmOrderView.confirmOrderButton.setTitle("Narući \(self.order.beveragesCounter) za \(self.order.beveragesPriceSum) Kn", for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //When user presses plus icon for specific beverage, this method will do appropriate visual changes on cell
    //Is called by "plusImageTapped"
    func changeCellAppereanceAfterPlusIsTapped(indexPath: IndexPath, plusImageRecognizer: MyTapGesture){
        if let cell = self.confirmOrderView.tableView.cellForRow(at: indexPath) as? BeverageCell {
            DispatchQueue.main.async {
                cell.orderedBeveragesSumLabel.isHidden = false
                cell.minusImage.isHidden = false
                self.confirmOrderView.confirmOrderButton.isHidden = false
                cell.orderedBeveragesSumLabel.text = "\(String(self.order.beverages[plusImageRecognizer.row].beverageCounter))x"
                cell.orderedBeveragesSumLabel.pulsate()
                self.confirmOrderView.confirmOrderButton.setTitle("Narući \(self.order.beveragesCounter) za \(self.order.beveragesPriceSum) Kn", for: .normal)
                self.confirmOrderView.confirmOrderButton.pulsate()
            }
        }
    }
    
    //Changes data of the variables after user clicked plusImage to add beverage
    @objc func plusImageTapped(plusImageRecognizer: MyTapGesture){
        self.order.beveragesCounter += 1
        self.order.beveragesPriceSum += order.beverages[plusImageRecognizer.row].price
        order.beverages[plusImageRecognizer.row].beverageCounter += 1
        let indexPath = IndexPath(row: plusImageRecognizer.row, section: plusImageRecognizer.section)
        changeCellAppereanceAfterPlusIsTapped(indexPath: indexPath, plusImageRecognizer: plusImageRecognizer)
    }
    
    //When user presses minus icon for specific beverage, this method will do appropriate visual changes on cell
    //Is called by "minusImageTapped"
    func changeCellAppereanceAfterMinusIsTapped(indexPath: IndexPath, minusImageRecognizer: MyTapGesture){
        if let cell = self.confirmOrderView.tableView.cellForRow(at: indexPath) as? BeverageCell {
            DispatchQueue.main.async {
                cell.orderedBeveragesSumLabel.text = "\(String(self.order.beverages[minusImageRecognizer.row].beverageCounter))x"
                cell.orderedBeveragesSumLabel.pulsate()
                if self.order.beverages[minusImageRecognizer.row].beverageCounter == 0 {
                    cell.orderedBeveragesSumLabel.isHidden = true
                    cell.minusImage.isHidden = true
                }
                self.confirmOrderView.confirmOrderButton.setTitle("Narući \(self.order.beveragesCounter) pića Za \(self.order.beveragesPriceSum) Kn", for: .normal)
                self.confirmOrderView.confirmOrderButton.pulsate()
                if self.order.beveragesCounter == 0 {
                    self.confirmOrderView.confirmOrderButton.isHidden = true
                }
            }
        }
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
    
}

extension ConfirmOrderViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.order.beverages.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.confirmOrderView.tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! BeverageCell
        cell.beverageNameLabel.text = order.beverages[indexPath.row].name
        cell.plusImage.image = UIImage(named: "grayPlusImage")
        cell.minusImage.image = UIImage(named: "grayMinusImage")
        cell.orderedBeveragesSumLabel.text = "\(String(order.beverages[indexPath.row].beverageCounter))x"
        cell.minusImage.isHidden = false
        cell.orderedBeveragesSumLabel.isHidden = false
        cell.beverageImageView.image = UIImage(named: order.beverages[indexPath.row].imageString)
        cell.priceLabel.text = "\(String(order.beverages[indexPath.row].price)) kn"
        
        let plusImageRecognizer = MyTapGesture(target: self, action: #selector(plusImageTapped(plusImageRecognizer:)))
        plusImageRecognizer.row = indexPath.row
        plusImageRecognizer.section = indexPath.section
        
        let minusImageRecognizer = MyTapGesture(target: self, action: #selector(minusImageTapped(minusImageRecognizer:)))
        minusImageRecognizer.row = indexPath.row
        minusImageRecognizer.section = indexPath.section
        
        cell.plusImage.isUserInteractionEnabled = true
        cell.plusImage.addGestureRecognizer(plusImageRecognizer)
        cell.minusImage.isUserInteractionEnabled = true
        cell.minusImage.addGestureRecognizer(minusImageRecognizer)
        cell.selectionStyle = .none
        return cell
    }
}

extension ConfirmOrderViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
    }
}

