//
//  InvoiceViewController.swift
//  MishiPay
//
//  Created by ds-mayur on 02/01/2021.
//

import UIKit

class InvoiceViewController: ParentViewController {

    //MARK:- IBOutlet
    @IBOutlet weak var invoiceTableView : UITableView!
    @IBOutlet weak var totalPaid : UILabel!
    
    //MARK:- Varible & Properties
    var productList = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setting up the UI
        setUI()
    }
    
    //MARK:- UI Methods
    private func setUI(){
       //Setting up the navigation bar title
        self.title = AllViewControllerEnum.invoiceViewController.getTitle()
        
        //Setting up the tableView
        setupTableView()
        
    }
    
    //Setting up the TableView
    private func setupTableView(){
        
        //Registering the TableView Cell class
        invoiceTableView.register(UINib(nibName: StoryboardAnXIBEnum.cartTableViewCell.rawValue, bundle: nil),
                               forCellReuseIdentifier: CartTableViewCell.identifier)
        
        invoiceTableView.dataSource = self
        invoiceTableView.delegate = self
    }
}

extension InvoiceViewController : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.identifier) as? CartTableViewCell else { return UITableViewCell() }
        
    }
}
