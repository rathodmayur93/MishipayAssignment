//
//  ViewController.swift
//  MishiPay
//
//  Created by ds-mayur on 02/01/2021.
//

import UIKit

class ViewController: ParentViewController {
    
    //MARK:- IBOutlet
    @IBOutlet weak var cartTableView : UITableView!
    
    //MARK:- Variables
    private let dataSource = CartListDataSource()
    private let delegate = CartTableViewDelegate()

    //MARK:- Lifecycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setting up the UI
        setUI()
    }
    
    
    //MARK:- UI Methods
    private func setUI(){
       //Setting up the navigation bar title
        self.title = AllViewControllerEnum.cartViewController.getTitle()
    }
    
    //Setting up the TableView
    private func setupTableView(){
        
        //Registering the TableView Cell class
        cartTableView.register(UINib(nibName: StoryboardAnXIBEnum.cartTableViewCell.rawValue, bundle: nil),
                               forCellReuseIdentifier: CartTableViewCell.identifier)
        
        
    }
}
