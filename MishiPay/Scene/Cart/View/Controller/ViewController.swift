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
    @IBOutlet weak var placeOrderBT : UIButton!
    
    //MARK:- Variables
    private let dataSource = CartListDataSource()
    private let delegate = CartTableViewDelegate()
    
    //Setting up the presenter
    lazy var cartPresenter : CartPresenter = {
        let presenter = CartPresenter(tableViewDataSource: dataSource,
                                      tableViewDelegate: delegate)
        return presenter
    }()

    //MARK:- Lifecycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setting up the UI
        setUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("== ViewDidAppear ==")
        cartPresenter.getAllProduct()
        cartTableView.reloadData()
    }
    
    //MARK:- UI Methods
    private func setUI(){
       //Setting up the navigation bar title
        self.title = AllViewControllerEnum.cartViewController.getTitle()
        
        //Setting up the db
        cartPresenter.addDataInDB()
        
        //Setting up the tableView
        setupTableView()
        
        //Setting up button
        configureButton()
        
    }
    
    //COnfigure button
    private func configureButton(){
        placeOrderBT.backgroundColor = ColorUtils.sharedInstance.getPrimaryButtonBackgroundColor()
        placeOrderBT.setTitleColor(ColorUtils.sharedInstance.getPrimaryButtonTextColor(),
                                   for: .normal)
        placeOrderBT.setTitle("Place Order", for: .normal)
    }
    
    //Setting up the TableView
    private func setupTableView(){
        
        //Registering the TableView Cell class
        cartTableView.register(UINib(nibName: StoryboardAnXIBEnum.cartTableViewCell.rawValue, bundle: nil),
                               forCellReuseIdentifier: CartTableViewCell.identifier)
        
        cartTableView.dataSource = dataSource
        cartTableView.delegate = delegate
        
        
    }
    
    //MARK: - IBAction Method
    @IBAction func barButtonAction(_ sender: Any) {
        CartRouter().navigateToScannerViewController(cartVC: self)
    }
    
    @IBAction func placeOrderBTAction(_ sender: Any) {
        
    }
    
}
