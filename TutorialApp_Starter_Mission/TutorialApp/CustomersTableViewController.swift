//
//  CustomersTableViewController.swift
//  TutorialApp
//
//  Created by Muessig, Kevin on 4/29/20.
//  Copyright © 2020 SAP. All rights reserved.
//

import UIKit
import SAPFiori
import SAPFoundation
import SAPOData
import SAPFioriFlows
import SAPCommon

class CustomersTableViewController: UITableViewController, SAPFioriLoadingIndicator {
    var loadingIndicator: FUILoadingIndicatorView?
    
    let destinations = FileConfigurationProvider("AppParameters").provideConfiguration().configuration["Destinations"] as! NSDictionary
    
    var dataService: ESPMContainer<OnlineODataProvider>? {
        guard let odataController = OnboardingSessionManager.shared.onboardingSession?.odataControllers[destinations["com.sap.edm.sampleservice.v2"] as! String] as? Comsapedmsampleservicev2OnlineODataController, let dataService = odataController.espmContainer else {
            AlertHelper.displayAlert(with: NSLocalizedString("OData service is not reachable, please onboard again.", comment: ""), error: nil, viewController: self)
            return nil
        }
        return dataService
    }
    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private let logger = Logger.shared(named: "ProductsTableViewController")
    
    private var customers = [Customer]()
    
    private var searchController: FUISearchController?
    private var searchedCustomers = [Customer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(FUIObjectTableViewCell.self, forCellReuseIdentifier: FUIObjectTableViewCell.reuseIdentifier)
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableView.automaticDimension
        
        loadData()
        setupSearchBar()
    }
    
    private func loadData() {
        showFioriLoadingIndicator()
        fetchCustomers {
            self.tableView.reloadData()
            self.hideFioriLoadingIndicator()
        }
    }
    
    private func fetchCustomers(completionHandler: @escaping () -> Void) {
        dataService?.fetchCustomers() { [weak self] result, error in
            if let error = error {
                AlertHelper.displayAlert(with: NSLocalizedString("Failed to load list of products!", comment: ""), error: error, viewController: self!)
                self?.logger.error("Failed to load list of products!", error: error)
                return
            }
            self?.customers = result!
            completionHandler()
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearching() ? searchedCustomers.count : customers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customer = isSearching() ? searchedCustomers[indexPath.row] : customers[indexPath.row]
        let customerCell = tableView.dequeueReusableCell(withIdentifier: FUIObjectTableViewCell.reuseIdentifier) as! FUIObjectTableViewCell
        customerCell.accessoryType = .none
        
        let customerName = "\(customer.firstName ?? "") \(customer.lastName ?? "")"
        customerCell.headlineText = customerName
        
        customerCell.detailImageView.image = FUIIconLibrary.system.me
        customerCell.detailImageView.isCircular = true
        
        if let customerDOB = customer.dateOfBirth {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            customerCell.subheadlineText = "\(dateFormatter.string(from: customerDOB.utc()))"
        }
        return customerCell
    }
    
    // MARK: - Search Bar
    
    private func setupSearchBar() {
        // Search Controller setup
        searchController = FUISearchController(searchResultsController: nil)
        searchController!.searchResultsUpdater = self
        searchController!.hidesNavigationBarDuringPresentation = true
        searchController!.searchBar.placeholderText = NSLocalizedString("Search for customers...", comment: "")
        searchController!.searchBar.isBarcodeScannerEnabled = false
        
        self.tableView.tableHeaderView = searchController!.searchBar
    }
    
    private func searchTextIsEmpty() -> Bool {
        return searchController?.searchBar.text?.isEmpty ?? true
    }
    
    private func searchProducts(_ searchText: String) {
        searchedCustomers = customers.filter({( customer : Customer) -> Bool in
            let customerName = "\(customer.firstName ?? "") \(customer.lastName ?? "")"
            return customerName.lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }
    
    private func isSearching() -> Bool {
        return searchController?.isActive ?? false && !searchTextIsEmpty()
    }
}

// MARK: - UISearchResultsUpdating extension

extension CustomersTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            searchProducts(searchText)
            return
        }
    }
}
