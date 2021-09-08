//
// TutorialApp
//
// Created by SAP BTP SDK Assistant for iOS application on 08/09/21
//

import ESPMContainerFmwk
import Foundation
import SAPCommon
import SAPFiori
import SAPFoundation
import SAPOData
import SAPOfflineOData

class SupplierDetailViewController: FUIFormTableViewController, SAPFioriLoadingIndicator {
    var dataService: ESPMContainer<OfflineODataProvider>!
    private var validity = [String: Bool]()
    var allowsEditableCells = false

    private var _entity: ESPMContainerFmwk.Supplier?
    var entity: ESPMContainerFmwk.Supplier {
        get {
            if self._entity == nil {
                self._entity = self.createEntityWithDefaultValues()
            }
            return self._entity!
        }
        set {
            self._entity = newValue
        }
    }

    private let logger = Logger.shared(named: "SupplierMasterViewControllerLogger")
    var loadingIndicator: FUILoadingIndicatorView?
    var entityUpdater: ESPMContainerEntityUpdaterDelegate?
    var tableUpdater: ESPMContainerEntitySetUpdaterDelegate?
    private let okTitle = NSLocalizedString("keyOkButtonTitle",
                                            value: "OK",
                                            comment: "XBUT: Title of OK button.")
    var preventNavigationLoop = false
    var entitySetName: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 44
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        if segue.identifier == "updateEntity" {
            // Show the Detail view with the current entity, where the properties scan be edited and updated
            self.logger.info("Showing a view to update the selected entity.")
            let dest = segue.destination as! UINavigationController
            let detailViewController = dest.viewControllers[0] as! SupplierDetailViewController
            detailViewController.title = NSLocalizedString("keyUpdateEntityTitle", value: "Update Entity", comment: "XTIT: Title of update selected entity screen.")
            detailViewController.dataService = self.dataService
            detailViewController.entity = self.entity
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: detailViewController, action: #selector(detailViewController.updateEntity))
            detailViewController.navigationItem.rightBarButtonItem = doneButton
            let cancelButton = UIBarButtonItem(title: NSLocalizedString("keyCancelButtonToGoPreviousScreen", value: "Cancel", comment: "XBUT: Title of Cancel button."), style: .plain, target: detailViewController, action: #selector(detailViewController.cancel))
            detailViewController.navigationItem.leftBarButtonItem = cancelButton
            detailViewController.allowsEditableCells = true
            detailViewController.entityUpdater = self
            detailViewController.entitySetName = self.entitySetName
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return self.cellForCity(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: Supplier.city)
        case 1:
            return self.cellForCountry(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: Supplier.country)
        case 2:
            return self.cellForEmailAddress(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: Supplier.emailAddress)
        case 3:
            return self.cellForHouseNumber(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: Supplier.houseNumber)
        case 4:
            return self.cellForPhoneNumber(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: Supplier.phoneNumber)
        case 5:
            return self.cellForPostalCode(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: Supplier.postalCode)
        case 6:
            return self.cellForStreet(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: Supplier.street)
        case 7:
            return self.cellForSupplierID(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: Supplier.supplierID)
        case 8:
            return self.cellForSupplierName(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: Supplier.supplierName)
        case 9:
            return self.cellForUpdatedTimestamp(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: Supplier.updatedTimestamp)
        case 10:
            let cell = CellCreationHelper.cellForDefault(tableView: tableView, indexPath: indexPath, editingIsAllowed: false)
            cell.keyName = "Products"
            if self.entity.isNew {
                cell.title.textColor = UIColor.lightGray
            }
            cell.value = " "
            cell.accessoryType = .disclosureIndicator
            return cell

        case 11:
            let cell = CellCreationHelper.cellForDefault(tableView: tableView, indexPath: indexPath, editingIsAllowed: false)
            cell.keyName = "PurchaseOrders"
            if self.entity.isNew {
                cell.title.textColor = UIColor.lightGray
            }
            cell.value = " "
            cell.accessoryType = .disclosureIndicator
            return cell

        default:
            return UITableViewCell()
        }
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 12
    }

    override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.preventNavigationLoop {
            AlertHelper.displayAlert(with: NSLocalizedString("keyAlertNavigationLoop", value: "No further navigation is possible.", comment: "XTIT: Title of alert message about preventing navigation loop."), error: nil, viewController: self)
            return
        }
        switch indexPath.row {
        case 10:
            if !self.entity.isNew {
                self.showFioriLoadingIndicator()
                let destinationStoryBoard = UIStoryboard(name: "Product", bundle: nil)
                let masterViewController = destinationStoryBoard.instantiateViewController(withIdentifier: "ProductMaster")
                func loadProperty(_ completionHandler: @escaping ([Product]?, Error?) -> Void) {
                    self.dataService.loadProperty(Supplier.products, into: self.entity) { error in
                        self.hideFioriLoadingIndicator()
                        if let error = error {
                            completionHandler(nil, error)
                            return
                        }
                        completionHandler(self.entity.products, nil)
                    }
                }
                (masterViewController as! ProductMasterViewController).loadEntitiesBlock = loadProperty
                masterViewController.navigationItem.title = "Products"
                (masterViewController as! ProductMasterViewController).preventNavigationLoop = true
                (masterViewController as! ProductMasterViewController).dataService = dataService
                self.navigationController?.pushViewController(masterViewController, animated: true)
            }
        case 11:
            if !self.entity.isNew {
                self.showFioriLoadingIndicator()
                let destinationStoryBoard = UIStoryboard(name: "PurchaseOrderHeader", bundle: nil)
                let masterViewController = destinationStoryBoard.instantiateViewController(withIdentifier: "PurchaseOrderHeaderMaster")
                func loadProperty(_ completionHandler: @escaping ([PurchaseOrderHeader]?, Error?) -> Void) {
                    self.dataService.loadProperty(Supplier.purchaseOrders, into: self.entity) { error in
                        self.hideFioriLoadingIndicator()
                        if let error = error {
                            completionHandler(nil, error)
                            return
                        }
                        completionHandler(self.entity.purchaseOrders, nil)
                    }
                }
                (masterViewController as! PurchaseOrderHeaderMasterViewController).loadEntitiesBlock = loadProperty
                masterViewController.navigationItem.title = "PurchaseOrders"
                (masterViewController as! PurchaseOrderHeaderMasterViewController).preventNavigationLoop = true
                (masterViewController as! PurchaseOrderHeaderMasterViewController).dataService = dataService
                self.navigationController?.pushViewController(masterViewController, animated: true)
            }
        default:
            return
        }
    }

    // MARK: - OData property specific cell creators

    private func cellForCity(tableView: UITableView, indexPath: IndexPath, currentEntity: ESPMContainerFmwk.Supplier, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.city {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.city = nil
                isNewValueValid = true
            } else {
                if Supplier.city.isOptional || newValue != "" {
                    currentEntity.city = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForCountry(tableView: UITableView, indexPath: IndexPath, currentEntity: ESPMContainerFmwk.Supplier, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.country {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.country = nil
                isNewValueValid = true
            } else {
                if Supplier.country.isOptional || newValue != "" {
                    currentEntity.country = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForEmailAddress(tableView: UITableView, indexPath: IndexPath, currentEntity: ESPMContainerFmwk.Supplier, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.emailAddress {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.emailAddress = nil
                isNewValueValid = true
            } else {
                if Supplier.emailAddress.isOptional || newValue != "" {
                    currentEntity.emailAddress = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForHouseNumber(tableView: UITableView, indexPath: IndexPath, currentEntity: ESPMContainerFmwk.Supplier, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.houseNumber {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.houseNumber = nil
                isNewValueValid = true
            } else {
                if Supplier.houseNumber.isOptional || newValue != "" {
                    currentEntity.houseNumber = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForPhoneNumber(tableView: UITableView, indexPath: IndexPath, currentEntity: ESPMContainerFmwk.Supplier, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.phoneNumber {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.phoneNumber = nil
                isNewValueValid = true
            } else {
                if Supplier.phoneNumber.isOptional || newValue != "" {
                    currentEntity.phoneNumber = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForPostalCode(tableView: UITableView, indexPath: IndexPath, currentEntity: ESPMContainerFmwk.Supplier, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.postalCode {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.postalCode = nil
                isNewValueValid = true
            } else {
                if Supplier.postalCode.isOptional || newValue != "" {
                    currentEntity.postalCode = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForStreet(tableView: UITableView, indexPath: IndexPath, currentEntity: ESPMContainerFmwk.Supplier, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.street {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.street = nil
                isNewValueValid = true
            } else {
                if Supplier.street.isOptional || newValue != "" {
                    currentEntity.street = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForSupplierID(tableView: UITableView, indexPath: IndexPath, currentEntity: ESPMContainerFmwk.Supplier, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.supplierID {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.supplierID = nil
                isNewValueValid = true
            } else {
                if Supplier.supplierID.isOptional || newValue != "" {
                    currentEntity.supplierID = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForSupplierName(tableView: UITableView, indexPath: IndexPath, currentEntity: ESPMContainerFmwk.Supplier, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.supplierName {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.supplierName = nil
                isNewValueValid = true
            } else {
                if Supplier.supplierName.isOptional || newValue != "" {
                    currentEntity.supplierName = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForUpdatedTimestamp(tableView: UITableView, indexPath: IndexPath, currentEntity: ESPMContainerFmwk.Supplier, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.updatedTimestamp {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.updatedTimestamp = nil
                isNewValueValid = true
            } else {
                if let validValue = LocalDateTime.parse(newValue) { // This is just a simple solution to handle UTC only
                    currentEntity.updatedTimestamp = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    // MARK: - OData functionalities

    @objc func createEntity() {
        self.showFioriLoadingIndicator()
        self.view.endEditing(true)
        self.logger.info("Creating entity in backend.")
        self.dataService.createEntity(self.entity) { error in
            self.hideFioriLoadingIndicator()
            if let error = error {
                self.logger.error("Create entry failed. Error: \(error)", error: error)
                AlertHelper.displayAlert(with: NSLocalizedString("keyErrorEntityCreationTitle", value: "Create entry failed", comment: "XTIT: Title of alert message about entity creation error."), error: error, viewController: self)
                return
            }

            self.logger.info("Create entry finished successfully.")
            DispatchQueue.main.async {
                self.dismiss(animated: true) {
                    FUIToastMessage.show(message: NSLocalizedString("keyEntityCreationBody", value: "Created", comment: "XMSG: Title of alert message about successful entity creation."))
                    self.tableUpdater?.entitySetHasChanged()
                }
            }
        }
    }

    func createEntityWithDefaultValues() -> ESPMContainerFmwk.Supplier {
        let newEntity = ESPMContainerFmwk.Supplier()

        // Key properties without default value should be invalid by default for Create scenario
        if newEntity.supplierID == nil || newEntity.supplierID!.isEmpty {
            self.validity["SupplierId"] = false
        }

        self.barButtonShouldBeEnabled()
        return newEntity
    }

    @objc func updateEntity(_: AnyObject) {
        self.showFioriLoadingIndicator()
        self.view.endEditing(true)
        self.logger.info("Updating entity in backend.")
        self.dataService.updateEntity(self.entity) { error in
            self.hideFioriLoadingIndicator()
            if let error = error {
                self.logger.error("Update entry failed. Error: \(error)", error: error)
                AlertHelper.displayAlert(with: NSLocalizedString("keyErrorEntityUpdateTitle", value: "Update entry failed", comment: "XTIT: Title of alert message about entity update failure."), error: error, viewController: self)
                return
            }

            self.logger.info("Update entry finished successfully.")
            DispatchQueue.main.async {
                self.dismiss(animated: true) {
                    FUIToastMessage.show(message: NSLocalizedString("keyUpdateEntityFinishedTitle", value: "Updated", comment: "XTIT: Title of alert message about successful entity update."))
                    self.entityUpdater?.entityHasChanged(self.entity)
                }
            }
        }
    }

    // MARK: - other logic, helper

    @objc func cancel() {
        DispatchQueue.main.async {
            self.dismiss(animated: true)
        }
    }

    // Check if all text fields are valid
    private func barButtonShouldBeEnabled() {
        let anyFieldInvalid = self.validity.values.first { field in
            field == false
        }
        self.navigationItem.rightBarButtonItem?.isEnabled = anyFieldInvalid == nil
    }
}

extension SupplierDetailViewController: ESPMContainerEntityUpdaterDelegate {
    func entityHasChanged(_ entityValue: EntityValue?) {
        if let entity = entityValue {
            let currentEntity = entity as! ESPMContainerFmwk.Supplier
            self.entity = currentEntity
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
}
