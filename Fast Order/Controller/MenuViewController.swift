//
//  MenuViewController.swift
//  Fast Order
//
//  Created by Domagoj Beronic on 11/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import Foundation
import UIKit

class MenuViewController: UIViewController {
    var menuViewControllerHowManyTimesDidAppearCounter = 0
    var menuView = MenuView()
    let laBodegaServices = LaBodegaService()
    
    let confirmOrderViewController = ConfirmOrderViewController()
    
    //menu is used to store data user wants to buy
    var menu: [SectionOfMenu] = []
    
    //Number od drinks user wants to buy
    var orderedBeveragesCounter = 0
    var orderedBeveragesPriceCounter = 0
    
    override func viewDidLoad() {
        menuView.tableView.dataSource = self
        menuView.tableView.delegate = self
        confirmOrderViewController.updateDataDelagate = self
        menuView.tableView.register(UINib(nibName: "BeverageCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        render()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func render(){
        self.menu = laBodegaServices.fillBeveragesMenu()
        setUpNavigationBar()
        setUpMenuView()
        setUpButtonsAction()
        activatePresentAnimation()
    }
    
    func setUpNavigationBar(){
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.topItem?.title = "La Bodega"
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: "Arial-BoldItalicMT", size: 32)!
        ]
    }
    
    //Animates coffeBarNameLabel and coffebarMenu when view appears on the screen
    func activatePresentAnimation(){
        UIView.animate(withDuration: 1.2, animations: {
            self.menuView.tableView.transform = CGAffineTransform(translationX: 351, y: 0)
        })
    }
    
    //Initialiazing order with data from beveregesMenu. BeveregesMenu holds ALL drinks in menu: the ones user did and didnt order
    //Order holds only drinks which user ordered
    func getOrder() -> Order {
        var orderedBeverages: [Beverage] = []
        for menu in menu {
            for beverage in menu.beverages {
                if beverage.beverageCounter > 0 {
                    orderedBeverages.append(beverage)
                }
            }
        }
        let order = Order(id: "999", tableNumber: 404, orderedBeveragesSum: orderedBeveragesCounter, orderedBeveragesPriceSum: orderedBeveragesPriceCounter, beverages: orderedBeverages)
        return order
    }
    
    //Gets user order and navigates to confirmOrderViewController
    @objc func makeOrderButtonPressed(){
        let order = getOrder()
        confirmOrderViewController.order = order
        self.navigationController?.pushViewController(confirmOrderViewController, animated: true)
    }
    
    func updateMenuBeverages(beverage: Beverage){
        if menu.count > 0 {
            for i in 0...menu.count-1{
                for j in 0...menu[i].beverages.count-1 {
                    if beverage.name == menu[i].beverages[j].name{
                        menu[i].beverages[j].beverageCounter = beverage.beverageCounter
                    }
                }
            }
        }
    }
    
    //When user presses minus icon for specific beverage, this method will do appropriate visual changes on cell
    //Called by "minusImageTapped"
    func changeCellAppereanceAfterMinusIsTapped(indexPath: IndexPath, minusImageRecognizer: MyTapGesture){
        if let cell = self.menuView.tableView.cellForRow(at: indexPath) as? BeverageCell {
            DispatchQueue.main.async {
                cell.orderedBeveragesSumLabel.text = "\(String(self.menu[minusImageRecognizer.section].beverages[minusImageRecognizer.row].beverageCounter))x"
                cell.orderedBeveragesSumLabel.pulsate()
                if self.menu[minusImageRecognizer.section].beverages[minusImageRecognizer.row].beverageCounter == 0 {
                    cell.orderedBeveragesSumLabel.isHidden = true
                    cell.minusImage.isHidden = true
                }
                self.menuView.makeOrderButton.setTitle("Narući \(self.orderedBeveragesCounter) za \(self.orderedBeveragesPriceCounter) Kn", for: .normal)
                self.menuView.makeOrderButton.pulsate()
                
                if self.orderedBeveragesCounter == 0 {
                    self.menuView.makeOrderButton.isHidden = true
                }
            }
        }
    }
    
    //Changes data of the variables after user clicked minusImage to subtract beverage
    @objc func minusImageTapped(minusImageRecognizer: MyTapGesture){
        self.orderedBeveragesCounter -= 1
        self.orderedBeveragesPriceCounter -= self.menu[minusImageRecognizer.section].beverages[minusImageRecognizer.row].price
        let indexPath = IndexPath(row: minusImageRecognizer.row, section: minusImageRecognizer.section)
        if menu[minusImageRecognizer.section].beverages[minusImageRecognizer.row].beverageCounter > 0 {
            self.menu[minusImageRecognizer.section].beverages[minusImageRecognizer.row].beverageCounter -= 1
            self.menu[minusImageRecognizer.section].counterOfOrdersInMenuSection -= 1
            self.changeCellAppereanceAfterMinusIsTapped(indexPath: indexPath, minusImageRecognizer: minusImageRecognizer)
        }
    }
    
    //When user presses plus icon for specific beverage, this method will do appropriate visual changes on cell
    //Is called by "plusImageTapped"
    func changeCellAppereanceAfterPlusIsTapped(indexPath: IndexPath, plusImageRecognizer: MyTapGesture){
        if let cell = self.menuView.tableView.cellForRow(at: indexPath) as? BeverageCell {
            DispatchQueue.main.async {
                cell.minusImage.isHidden = false
                cell.orderedBeveragesSumLabel.isHidden = false
                cell.orderedBeveragesSumLabel.text = "\(String(self.menu[plusImageRecognizer.section].beverages[plusImageRecognizer.row].beverageCounter))x"
                cell.orderedBeveragesSumLabel.pulsate()
                
                self.menuView.makeOrderButton.isHidden = false
                self.menuView.makeOrderButton.setTitle("Narući \(self.orderedBeveragesCounter) za \(self.orderedBeveragesPriceCounter) Kn", for: .normal)
                self.menuView.makeOrderButton.pulsate()
            }
        }
    }
    
    //Changes data of the variables after user clicked plusImage to add beverage
    @objc func plusImageTapped(plusImageRecognizer: MyTapGesture){
        self.orderedBeveragesCounter += 1
        self.orderedBeveragesPriceCounter += self.menu[plusImageRecognizer.section].beverages[plusImageRecognizer.row].price
        self.menu[plusImageRecognizer.section].counterOfOrdersInMenuSection += 1
        menu[plusImageRecognizer.section].beverages[plusImageRecognizer.row].beverageCounter += 1
        let indexPath = IndexPath(row: plusImageRecognizer.row, section: plusImageRecognizer.section)
        self.changeCellAppereanceAfterPlusIsTapped(indexPath: indexPath, plusImageRecognizer: plusImageRecognizer)
    }
    
    //Called after user clicked Beverages Section. For example: User clicks on "Alcoholic Drinks" and it
    //expands or closes "Alcoholic drinks" section depending on the isExpanded boolean of section
    @objc func handleExpandClose(button: UIButton){
        DispatchQueue.main.async {
            var indexPaths = [IndexPath]()
            let section = button.tag
            for row in self.menu[section].beverages.indices{
                let indexPath = IndexPath(row: row, section: section)
                indexPaths.append(indexPath)
            }
            let isExpanded = self.menu[section].isExpanded
            if isExpanded && self.menu[section].counterOfOrdersInMenuSection == 0  {
                self.menu[section].isExpanded = !isExpanded
                self.menuView.tableView.deleteRows(at: indexPaths, with: .fade)
            } else if !isExpanded && self.menu[section].counterOfOrdersInMenuSection == 0 {
                self.menu[section].isExpanded = !isExpanded
                self.menuView.tableView.insertRows(at: indexPaths, with: .fade)
                let indexPath2 = IndexPath(row: 0, section: section)
                self.menuView.tableView.scrollToRow(at: indexPath2, at: .top, animated: true)
            }
            self.menuView.tableView.reloadData()
        }
    }
    
    func setUpButtonsAction(){
        menuView.makeOrderButton.addTarget(self, action: #selector(makeOrderButtonPressed), for: .touchUpInside)
    }
    
    func setUpMenuView(){
        view.addSubview(menuView)
        menuView.translatesAutoresizingMaskIntoConstraints = false
        menuView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        menuView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        menuView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        menuView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}

extension MenuViewController: UITableViewDataSource {
    //Will not show rows of section which has value of variable "isExpanded" false
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !menu[section].isExpanded {
            return 0
        }
        return menu[section].beverages.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.menuView.tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! BeverageCell
        cell.orderedBeveragesSumLabel.isHidden = true
        
        //If and else clause will fix problem connected to Reusable cell appearance
        if menu[indexPath.section].beverages[indexPath.row].beverageCounter > 0 {
            cell.minusImage.isHidden = false
            cell.orderedBeveragesSumLabel.isHidden = false
            cell.orderedBeveragesSumLabel.text = "\(String(menu[indexPath.section].beverages[indexPath.row].beverageCounter))x"
        } else {
            cell.minusImage.isHidden = true
        }
        cell.beverageNameLabel.text = menu[indexPath.section].beverages[indexPath.row].name
        cell.plusImage.image = UIImage(named: "grayPlusImage")
        cell.minusImage.image = UIImage(named: "grayMinusImage")
        cell.beverageImageView.image = UIImage(named: menu[indexPath.section].beverages[indexPath.row].imageString)
        cell.priceLabel.text = "\(String(menu[indexPath.section].beverages[indexPath.row].price)) kn"
        
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
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 90
       }
    
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        view.tintColor = .black
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let image = UIImage(named: "coffeImage") as UIImage?
//        let button = UIButton(type: .system)
//        button.setImage(image, for: .normal)
//        button.setTitleColor(.white, for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 20.0, weight: .bold)
//        button.setTitle(self.menu[section].title, for: .normal)
//        button.addTarget(self, action: #selector(handleExpandClose), for: .touchUpInside)
//        button.backgroundColor = .black
//        button.layer.cornerRadius = 20
//        button.tag = section
//        return button
        let view = UIView()
        let image = UIImageView()
        view.frame = CGRect(x: 10, y: 0, width: tableView.frame.width - 20, height: 90)
        image.frame = CGRect(x: 10 , y: 0, width: view.frame.width, height: view.frame.height)
        image.image = UIImage.init(named: self.menu[section].imageString)
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 10, y: 0, width: view.frame.width, height: view.frame.height)
        button.setTitle(self.menu[section].title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.shadowOpacity = 0.9
        button.addTarget(self, action: #selector(handleExpandClose), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20.0, weight: .bold)
        button.tag = section
        
        
        view.layer.cornerRadius = 20
        view.addSubview(image)
        view.addSubview(button)
        return view
    }
}

extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
    }
}

//Updates data in tableView with beverages added or subtracted in ConfirmOrderViewController
extension MenuViewController: UpdateDataFromConfirmOrderVC {
    func updateDataInTableView(order: Order) {
        if order.beverages.count == 0 {
            resetTableViewData()
        } else {
        for beverage in order.beverages {
            self.updateMenuBeverages(beverage: beverage)
        }
        menuView.tableView.reloadData()
        self.orderedBeveragesCounter = order.beveragesCounter
        self.orderedBeveragesPriceCounter = order.beveragesPriceSum
        self.menuView.makeOrderButton.setTitle("Narući \(order.beveragesCounter) za \(order.beveragesPriceSum) Kn", for: .normal)
        }
    }
    
    func resetTableViewData(){
           self.orderedBeveragesCounter = 0
           self.orderedBeveragesPriceCounter = 0
           self.menu = []
           self.menu = self.laBodegaServices.fillBeveragesMenu()
           self.menuView.makeOrderButton.isHidden = true
           self.menuView.tableView.reloadData()
       }
}

