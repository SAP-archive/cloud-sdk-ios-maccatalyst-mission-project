//
//  SidebarTableViewController.swift
//  TutorialApp
//
//  Created by Muessig, Kevin on 12.07.21.
//  Copyright © 2021 SAP. All rights reserved.
//

import UIKit
import SAPFiori
import SAPCommon

class SidebarTableViewController: UITableViewController {
    
    private let logger = Logger.shared(named: "SidebarTableViewController")

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = NSLocalizedString("Navigation", comment: "")
        
        tableView.register(FUIObjectTableViewCell.self, forCellReuseIdentifier: FUIObjectTableViewCell.reuseIdentifier)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FUIObjectTableViewCell.reuseIdentifier) as! FUIObjectTableViewCell

        // Define a UIImage SymbolConfiguration with the scaling factor of small. This allows the system to scale the SF Symbol accordingly.
        let smallConfiguration = UIImage.SymbolConfiguration(scale: .small)

        // Switch Statement to go over the different rows. Set the headline text and the detail image using SF Symbols.
        switch indexPath.row {
        case 0:
            cell.headlineText = NSLocalizedString("Overview", comment: "")
            cell.detailImage = UIImage(systemName: "globe", withConfiguration: smallConfiguration)
        case 1:
            cell.headlineText = NSLocalizedString("Products", comment: "")
            cell.detailImage = UIImage(systemName: "tv", withConfiguration: smallConfiguration)
        case 2:
            cell.headlineText = NSLocalizedString("Customers", comment: "")
            cell.detailImage = UIImage(systemName: "person", withConfiguration: smallConfiguration)
        default:
            return UITableViewCell()
        }

        return cell
    }
    
    override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewSelected(at: indexPath)
    }

    // CollectionType selection helper
    private func viewSelected(at indexPath: IndexPath) {
        // Load the EntityType specific ViewController from the specific storyboard"
        var viewController: UIViewController!

        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)

        // Decide which View Controller to instantiate.
        switch indexPath.row {
        case 0:
            viewController = mainStoryboard.instantiateViewController(identifier: "OverviewTableViewController")
        case 1:
            viewController = mainStoryboard.instantiateViewController(identifier: "ProductsTableViewController")
        case 2:
            viewController = mainStoryboard.instantiateViewController(identifier: "CustomersTableViewController")
        default:
            viewController = UIViewController()
        }

        // Load the NavigationController and present with the EntityType specific ViewController
        let rightNavigationController = mainStoryboard.instantiateViewController(withIdentifier: "SubNavigationController") as! UINavigationController
        rightNavigationController.viewControllers = [viewController]

        // Display the Detail View Controller
        splitViewController?.showDetailViewController(rightNavigationController, sender: nil)
    }
}
