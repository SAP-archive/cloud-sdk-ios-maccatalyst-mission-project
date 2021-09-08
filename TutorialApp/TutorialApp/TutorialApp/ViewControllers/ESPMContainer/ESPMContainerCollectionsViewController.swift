//
// TutorialApp
//
// Created by SAP BTP SDK Assistant for iOS application on 08/09/21
//

import SAPFiori
import SAPFioriFlows
import SAPFoundation
import SAPOData

import ESPMContainerFmwk
import SharedFmwk

protocol ESPMContainerEntityUpdaterDelegate {
    func entityHasChanged(_ entity: EntityValue?)
}

protocol ESPMContainerEntitySetUpdaterDelegate {
    func entitySetHasChanged()
}

class ESPMContainerCollectionsViewController: FUIFormTableViewController {
    private var collections = ESPMContainerCollectionType.allCases

    // Variable to store the selected index path
    private var selectedIndex: IndexPath?

    private let okTitle = NSLocalizedString("keyOkButtonTitle",
                                            value: "OK",
                                            comment: "XBUT: Title of OK button.")

    var isPresentedInSplitView: Bool {
        return !(self.splitViewController?.isCollapsed ?? true)
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.preferredContentSize = CGSize(width: 320, height: 480)

        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 44
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.makeSelection()
    }

    override func viewWillTransition(to _: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: nil, completion: { _ in
            let isNotInSplitView = !self.isPresentedInSplitView
            self.tableView.visibleCells.forEach { cell in
                // To refresh the disclosure indicator of each cell
                cell.accessoryType = isNotInSplitView ? .disclosureIndicator : .none
            }
            self.makeSelection()
        })
    }

    // MARK: - UITableViewDelegate

    override func numberOfSections(in _: UITableView) -> Int {
        return 1
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return collections.count
    }

    override func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return 44
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FUIObjectTableViewCell.reuseIdentifier, for: indexPath) as! FUIObjectTableViewCell
        cell.headlineLabel.text = self.collections[indexPath.row].description
        cell.accessoryType = !self.isPresentedInSplitView ? .disclosureIndicator : .none
        cell.isMomentarySelection = false
        return cell
    }

    override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.collectionSelected(at: indexPath)
    }

    // CollectionType selection helper
    private func collectionSelected(at indexPath: IndexPath) {
        // Load the EntityType specific ViewController from the specific storyboard"
        var masterViewController: UIViewController!
        guard let odataController = OnboardingSessionManager.shared.onboardingSession?.odataControllers[ODataContainerType.eSPMContainer.description] as? ESPMContainerOfflineODataController, let dataService = odataController.dataService else {
            AlertHelper.displayAlert(with: "OData service is not reachable, please onboard again.", error: nil, viewController: self)
            return
        }
        self.selectedIndex = indexPath

        switch self.collections[indexPath.row] {
        case .suppliers:
            let supplierStoryBoard = UIStoryboard(name: "Supplier", bundle: nil)
            let supplierMasterViewController = supplierStoryBoard.instantiateViewController(withIdentifier: "SupplierMaster") as! SupplierMasterViewController
            supplierMasterViewController.dataService = dataService
            supplierMasterViewController.entitySetName = "Suppliers"
            func fetchSuppliers(_ completionHandler: @escaping ([ESPMContainerFmwk.Supplier]?, Error?) -> Void) {
                // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
                let query = DataQuery().selectAll().top(20)
                do {
                    dataService.fetchSuppliers(matching: query, completionHandler: completionHandler)
                }
            }
            supplierMasterViewController.loadEntitiesBlock = fetchSuppliers
            supplierMasterViewController.navigationItem.title = "Supplier"
            masterViewController = supplierMasterViewController
        case .products:
            let productStoryBoard = UIStoryboard(name: "Product", bundle: nil)
            let productMasterViewController = productStoryBoard.instantiateViewController(withIdentifier: "ProductMaster") as! ProductMasterViewController
            productMasterViewController.dataService = dataService
            productMasterViewController.entitySetName = "Products"
            func fetchProducts(_ completionHandler: @escaping ([ESPMContainerFmwk.Product]?, Error?) -> Void) {
                // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
                let query = DataQuery().selectAll().top(20)
                do {
                    dataService.fetchProducts(matching: query, completionHandler: completionHandler)
                }
            }
            productMasterViewController.loadEntitiesBlock = fetchProducts
            productMasterViewController.navigationItem.title = "Product"
            masterViewController = productMasterViewController
        case .stock:
            let stockStoryBoard = UIStoryboard(name: "Stock", bundle: nil)
            let stockMasterViewController = stockStoryBoard.instantiateViewController(withIdentifier: "StockMaster") as! StockMasterViewController
            stockMasterViewController.dataService = dataService
            stockMasterViewController.entitySetName = "Stock"
            func fetchStock(_ completionHandler: @escaping ([ESPMContainerFmwk.Stock]?, Error?) -> Void) {
                // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
                let query = DataQuery().selectAll().top(20)
                do {
                    dataService.fetchStock(matching: query, completionHandler: completionHandler)
                }
            }
            stockMasterViewController.loadEntitiesBlock = fetchStock
            stockMasterViewController.navigationItem.title = "Stock"
            masterViewController = stockMasterViewController
        case .customers:
            let customerStoryBoard = UIStoryboard(name: "Customer", bundle: nil)
            let customerMasterViewController = customerStoryBoard.instantiateViewController(withIdentifier: "CustomerMaster") as! CustomerMasterViewController
            customerMasterViewController.dataService = dataService
            customerMasterViewController.entitySetName = "Customers"
            func fetchCustomers(_ completionHandler: @escaping ([ESPMContainerFmwk.Customer]?, Error?) -> Void) {
                // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
                let query = DataQuery().selectAll().top(20)
                do {
                    dataService.fetchCustomers(matching: query, completionHandler: completionHandler)
                }
            }
            customerMasterViewController.loadEntitiesBlock = fetchCustomers
            customerMasterViewController.navigationItem.title = "Customer"
            masterViewController = customerMasterViewController
        case .productCategories:
            let productCategoryStoryBoard = UIStoryboard(name: "ProductCategory", bundle: nil)
            let productCategoryMasterViewController = productCategoryStoryBoard.instantiateViewController(withIdentifier: "ProductCategoryMaster") as! ProductCategoryMasterViewController
            productCategoryMasterViewController.dataService = dataService
            productCategoryMasterViewController.entitySetName = "ProductCategories"
            func fetchProductCategories(_ completionHandler: @escaping ([ESPMContainerFmwk.ProductCategory]?, Error?) -> Void) {
                // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
                let query = DataQuery().selectAll().top(20)
                do {
                    dataService.fetchProductCategories(matching: query, completionHandler: completionHandler)
                }
            }
            productCategoryMasterViewController.loadEntitiesBlock = fetchProductCategories
            productCategoryMasterViewController.navigationItem.title = "ProductCategory"
            masterViewController = productCategoryMasterViewController
        case .purchaseOrderItems:
            let purchaseOrderItemStoryBoard = UIStoryboard(name: "PurchaseOrderItem", bundle: nil)
            let purchaseOrderItemMasterViewController = purchaseOrderItemStoryBoard.instantiateViewController(withIdentifier: "PurchaseOrderItemMaster") as! PurchaseOrderItemMasterViewController
            purchaseOrderItemMasterViewController.dataService = dataService
            purchaseOrderItemMasterViewController.entitySetName = "PurchaseOrderItems"
            func fetchPurchaseOrderItems(_ completionHandler: @escaping ([ESPMContainerFmwk.PurchaseOrderItem]?, Error?) -> Void) {
                // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
                let query = DataQuery().selectAll().top(20)
                do {
                    dataService.fetchPurchaseOrderItems(matching: query, completionHandler: completionHandler)
                }
            }
            purchaseOrderItemMasterViewController.loadEntitiesBlock = fetchPurchaseOrderItems
            purchaseOrderItemMasterViewController.navigationItem.title = "PurchaseOrderItem"
            masterViewController = purchaseOrderItemMasterViewController
        case .productTexts:
            let productTextStoryBoard = UIStoryboard(name: "ProductText", bundle: nil)
            let productTextMasterViewController = productTextStoryBoard.instantiateViewController(withIdentifier: "ProductTextMaster") as! ProductTextMasterViewController
            productTextMasterViewController.dataService = dataService
            productTextMasterViewController.entitySetName = "ProductTexts"
            func fetchProductTexts(_ completionHandler: @escaping ([ESPMContainerFmwk.ProductText]?, Error?) -> Void) {
                // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
                let query = DataQuery().selectAll().top(20)
                do {
                    dataService.fetchProductTexts(matching: query, completionHandler: completionHandler)
                }
            }
            productTextMasterViewController.loadEntitiesBlock = fetchProductTexts
            productTextMasterViewController.navigationItem.title = "ProductText"
            masterViewController = productTextMasterViewController
        case .purchaseOrderHeaders:
            let purchaseOrderHeaderStoryBoard = UIStoryboard(name: "PurchaseOrderHeader", bundle: nil)
            let purchaseOrderHeaderMasterViewController = purchaseOrderHeaderStoryBoard.instantiateViewController(withIdentifier: "PurchaseOrderHeaderMaster") as! PurchaseOrderHeaderMasterViewController
            purchaseOrderHeaderMasterViewController.dataService = dataService
            purchaseOrderHeaderMasterViewController.entitySetName = "PurchaseOrderHeaders"
            func fetchPurchaseOrderHeaders(_ completionHandler: @escaping ([ESPMContainerFmwk.PurchaseOrderHeader]?, Error?) -> Void) {
                // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
                let query = DataQuery().selectAll().top(20)
                do {
                    dataService.fetchPurchaseOrderHeaders(matching: query, completionHandler: completionHandler)
                }
            }
            purchaseOrderHeaderMasterViewController.loadEntitiesBlock = fetchPurchaseOrderHeaders
            purchaseOrderHeaderMasterViewController.navigationItem.title = "PurchaseOrderHeader"
            masterViewController = purchaseOrderHeaderMasterViewController
        case .salesOrderHeaders:
            let salesOrderHeaderStoryBoard = UIStoryboard(name: "SalesOrderHeader", bundle: nil)
            let salesOrderHeaderMasterViewController = salesOrderHeaderStoryBoard.instantiateViewController(withIdentifier: "SalesOrderHeaderMaster") as! SalesOrderHeaderMasterViewController
            salesOrderHeaderMasterViewController.dataService = dataService
            salesOrderHeaderMasterViewController.entitySetName = "SalesOrderHeaders"
            func fetchSalesOrderHeaders(_ completionHandler: @escaping ([ESPMContainerFmwk.SalesOrderHeader]?, Error?) -> Void) {
                // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
                let query = DataQuery().selectAll().top(20)
                do {
                    dataService.fetchSalesOrderHeaders(matching: query, completionHandler: completionHandler)
                }
            }
            salesOrderHeaderMasterViewController.loadEntitiesBlock = fetchSalesOrderHeaders
            salesOrderHeaderMasterViewController.navigationItem.title = "SalesOrderHeader"
            masterViewController = salesOrderHeaderMasterViewController
        case .salesOrderItems:
            let salesOrderItemStoryBoard = UIStoryboard(name: "SalesOrderItem", bundle: nil)
            let salesOrderItemMasterViewController = salesOrderItemStoryBoard.instantiateViewController(withIdentifier: "SalesOrderItemMaster") as! SalesOrderItemMasterViewController
            salesOrderItemMasterViewController.dataService = dataService
            salesOrderItemMasterViewController.entitySetName = "SalesOrderItems"
            func fetchSalesOrderItems(_ completionHandler: @escaping ([ESPMContainerFmwk.SalesOrderItem]?, Error?) -> Void) {
                // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
                let query = DataQuery().selectAll().top(20)
                do {
                    dataService.fetchSalesOrderItems(matching: query, completionHandler: completionHandler)
                }
            }
            salesOrderItemMasterViewController.loadEntitiesBlock = fetchSalesOrderItems
            salesOrderItemMasterViewController.navigationItem.title = "SalesOrderItem"
            masterViewController = salesOrderItemMasterViewController
        @unknown default:
            masterViewController = UIViewController()
        }

        // Load the NavigationController and present with the EntityType specific ViewController
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let rightNavigationController = mainStoryBoard.instantiateViewController(withIdentifier: "RightNavigationController") as! UINavigationController
        rightNavigationController.viewControllers = [masterViewController]
        self.splitViewController?.showDetailViewController(rightNavigationController, sender: nil)
    }

    // MARK: - Handle highlighting of selected cell

    private func makeSelection() {
        if let selectedIndex = selectedIndex {
            tableView.selectRow(at: selectedIndex, animated: true, scrollPosition: .none)
            tableView.scrollToRow(at: selectedIndex, at: .none, animated: true)
        } else {
            selectDefault()
        }
    }

    private func selectDefault() {
        // Automatically select first element if we have two panels (iPhone plus and iPad only)
        guard let odataController = OnboardingSessionManager.shared.onboardingSession?.odataControllers[ODataContainerType.eSPMContainer.description] as? ESPMContainerOfflineODataController else {
            AlertHelper.displayAlert(with: "OData service is not reachable, please onboard again.", error: nil, viewController: self)
            return
        }

        if self.splitViewController!.isCollapsed || odataController.dataService == nil {
            return
        }
        let indexPath = IndexPath(row: 0, section: 0)
        self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: .middle)
        self.collectionSelected(at: indexPath)
    }

    static func entitySet(withName entitySetName: String?) -> EntitySet? {
        switch entitySetName {
        case "Suppliers": return ESPMContainerMetadata.EntitySets.suppliers
        case "Products": return ESPMContainerMetadata.EntitySets.products
        case "Stock": return ESPMContainerMetadata.EntitySets.stock
        case "Customers": return ESPMContainerMetadata.EntitySets.customers
        case "ProductCategories": return ESPMContainerMetadata.EntitySets.productCategories
        case "PurchaseOrderItems": return ESPMContainerMetadata.EntitySets.purchaseOrderItems
        case "ProductTexts": return ESPMContainerMetadata.EntitySets.productTexts
        case "PurchaseOrderHeaders": return ESPMContainerMetadata.EntitySets.purchaseOrderHeaders
        case "SalesOrderHeaders": return ESPMContainerMetadata.EntitySets.salesOrderHeaders
        case "SalesOrderItems": return ESPMContainerMetadata.EntitySets.salesOrderItems
        default: return nil
        }
    }
}
