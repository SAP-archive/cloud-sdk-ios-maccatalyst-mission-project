//
// TutorialApp
//
// Created by SAP BTP SDK Assistant for iOS v7.0.0 application on 04/01/22
//

import ESPMContainerFmwk
import Foundation
import SAPCommon
import SAPFiori
import SAPFoundation
import SAPOData
import SAPOfflineOData

class CustomerDetailViewController: FUIFormTableViewController, SAPFioriLoadingIndicator {
    var dataService: ESPMContainer<OfflineODataProvider>!
    private var validity = [String: Bool]()
    var allowsEditableCells = false

    private var _entity: ESPMContainerFmwk.Customer?
    var entity: ESPMContainerFmwk.Customer {
        get {
            if _entity == nil {
                _entity = createEntityWithDefaultValues()
            }
            return _entity!
        }
        set {
            _entity = newValue
        }
    }

    private let logger = Logger.shared(named: "CustomerMasterViewControllerLogger")
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
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        if segue.identifier == "updateEntity" {
            // Show the Detail view with the current entity, where the properties scan be edited and updated
            logger.info("Showing a view to update the selected entity.")
            let dest = segue.destination as! UINavigationController
            let detailViewController = dest.viewControllers[0] as! CustomerDetailViewController
            detailViewController.title = NSLocalizedString("keyUpdateEntityTitle", value: "Update Entity", comment: "XTIT: Title of update selected entity screen.")
            detailViewController.dataService = dataService
            detailViewController.entity = entity
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: detailViewController, action: #selector(detailViewController.updateEntity))
            detailViewController.navigationItem.rightBarButtonItem = doneButton
            let cancelButton = UIBarButtonItem(title: NSLocalizedString("keyCancelButtonToGoPreviousScreen", value: "Cancel", comment: "XBUT: Title of Cancel button."), style: .plain, target: detailViewController, action: #selector(detailViewController.cancel))
            detailViewController.navigationItem.leftBarButtonItem = cancelButton
            detailViewController.allowsEditableCells = true
            detailViewController.entityUpdater = self
            detailViewController.entitySetName = entitySetName
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return cellForCity(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: Customer.city)
        case 1:
            return cellForCountry(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: Customer.country)
        case 2:
            return cellForCustomerID(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: Customer.customerID)
        case 3:
            return cellForDateOfBirth(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: Customer.dateOfBirth)
        case 4:
            return cellForEmailAddress(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: Customer.emailAddress)
        case 5:
            return cellForFirstName(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: Customer.firstName)
        case 6:
            return cellForHouseNumber(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: Customer.houseNumber)
        case 7:
            return cellForLastName(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: Customer.lastName)
        case 8:
            return cellForPhoneNumber(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: Customer.phoneNumber)
        case 9:
            return cellForPostalCode(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: Customer.postalCode)
        case 10:
            return cellForStreet(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: Customer.street)
        case 11:
            return cellForUpdatedTimestamp(tableView: tableView, indexPath: indexPath, currentEntity: entity, property: Customer.updatedTimestamp)
        case 12:
            let cell = CellCreationHelper.cellForDefault(tableView: tableView, indexPath: indexPath, editingIsAllowed: false)
            cell.keyName = "SalesOrders"
            if entity.isNew {
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
        return 13
    }

    override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        if preventNavigationLoop {
            AlertHelper.displayAlert(with: NSLocalizedString("keyAlertNavigationLoop", value: "No further navigation is possible.", comment: "XTIT: Title of alert message about preventing navigation loop."), error: nil, viewController: self)
            return
        }
        switch indexPath.row {
        case 12:
            if !entity.isNew {
                showFioriLoadingIndicator()
                let destinationStoryBoard = UIStoryboard(name: "SalesOrderHeader", bundle: nil)
                let masterViewController = destinationStoryBoard.instantiateViewController(withIdentifier: "SalesOrderHeaderMaster")
                func loadProperty(_ completionHandler: @escaping ([SalesOrderHeader]?, Error?) -> Void) {
                    dataService.loadProperty(Customer.salesOrders, into: entity) { error in
                        self.hideFioriLoadingIndicator()
                        if let error = error {
                            completionHandler(nil, error)
                            return
                        }
                        completionHandler(self.entity.salesOrders, nil)
                    }
                }
                (masterViewController as! SalesOrderHeaderMasterViewController).loadEntitiesBlock = loadProperty
                masterViewController.navigationItem.title = "SalesOrders"
                (masterViewController as! SalesOrderHeaderMasterViewController).preventNavigationLoop = true
                (masterViewController as! SalesOrderHeaderMasterViewController).dataService = dataService
                navigationController?.pushViewController(masterViewController, animated: true)
            }
        default:
            return
        }
    }

    // MARK: - OData property specific cell creators

    private func cellForCity(tableView: UITableView, indexPath: IndexPath, currentEntity: ESPMContainerFmwk.Customer, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.city {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler:
            { (newValue: String) -> Bool in
                var isNewValueValid = false
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.city = nil
                    isNewValueValid = true
                } else {
                    if Customer.city.isOptional || newValue != "" {
                        currentEntity.city = newValue
                        isNewValueValid = true
                    }
                }
                self.validity[property.name] = isNewValueValid
                self.barButtonShouldBeEnabled()
                return isNewValueValid
            })
    }

    private func cellForCountry(tableView: UITableView, indexPath: IndexPath, currentEntity: ESPMContainerFmwk.Customer, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.country {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler:
            { (newValue: String) -> Bool in
                var isNewValueValid = false
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.country = nil
                    isNewValueValid = true
                } else {
                    if Customer.country.isOptional || newValue != "" {
                        currentEntity.country = newValue
                        isNewValueValid = true
                    }
                }
                self.validity[property.name] = isNewValueValid
                self.barButtonShouldBeEnabled()
                return isNewValueValid
            })
    }

    private func cellForCustomerID(tableView: UITableView, indexPath: IndexPath, currentEntity: ESPMContainerFmwk.Customer, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.customerID {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler:
            { (newValue: String) -> Bool in
                var isNewValueValid = false
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.customerID = nil
                    isNewValueValid = true
                } else {
                    if Customer.customerID.isOptional || newValue != "" {
                        currentEntity.customerID = newValue
                        isNewValueValid = true
                    }
                }
                self.validity[property.name] = isNewValueValid
                self.barButtonShouldBeEnabled()
                return isNewValueValid
            })
    }

    private func cellForDateOfBirth(tableView: UITableView, indexPath: IndexPath, currentEntity: ESPMContainerFmwk.Customer, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.dateOfBirth {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler:
            { (newValue: String) -> Bool in
                var isNewValueValid = false
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.dateOfBirth = nil
                    isNewValueValid = true
                } else {
                    if let validValue = LocalDateTime.parse(newValue) { // This is just a simple solution to handle UTC only
                        currentEntity.dateOfBirth = validValue
                        isNewValueValid = true
                    }
                }
                self.validity[property.name] = isNewValueValid
                self.barButtonShouldBeEnabled()
                return isNewValueValid
            })
    }

    private func cellForEmailAddress(tableView: UITableView, indexPath: IndexPath, currentEntity: ESPMContainerFmwk.Customer, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.emailAddress {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler:
            { (newValue: String) -> Bool in
                var isNewValueValid = false
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.emailAddress = nil
                    isNewValueValid = true
                } else {
                    if Customer.emailAddress.isOptional || newValue != "" {
                        currentEntity.emailAddress = newValue
                        isNewValueValid = true
                    }
                }
                self.validity[property.name] = isNewValueValid
                self.barButtonShouldBeEnabled()
                return isNewValueValid
            })
    }

    private func cellForFirstName(tableView: UITableView, indexPath: IndexPath, currentEntity: ESPMContainerFmwk.Customer, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.firstName {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler:
            { (newValue: String) -> Bool in
                var isNewValueValid = false
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.firstName = nil
                    isNewValueValid = true
                } else {
                    if Customer.firstName.isOptional || newValue != "" {
                        currentEntity.firstName = newValue
                        isNewValueValid = true
                    }
                }
                self.validity[property.name] = isNewValueValid
                self.barButtonShouldBeEnabled()
                return isNewValueValid
            })
    }

    private func cellForHouseNumber(tableView: UITableView, indexPath: IndexPath, currentEntity: ESPMContainerFmwk.Customer, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.houseNumber {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler:
            { (newValue: String) -> Bool in
                var isNewValueValid = false
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.houseNumber = nil
                    isNewValueValid = true
                } else {
                    if Customer.houseNumber.isOptional || newValue != "" {
                        currentEntity.houseNumber = newValue
                        isNewValueValid = true
                    }
                }
                self.validity[property.name] = isNewValueValid
                self.barButtonShouldBeEnabled()
                return isNewValueValid
            })
    }

    private func cellForLastName(tableView: UITableView, indexPath: IndexPath, currentEntity: ESPMContainerFmwk.Customer, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.lastName {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler:
            { (newValue: String) -> Bool in
                var isNewValueValid = false
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.lastName = nil
                    isNewValueValid = true
                } else {
                    if Customer.lastName.isOptional || newValue != "" {
                        currentEntity.lastName = newValue
                        isNewValueValid = true
                    }
                }
                self.validity[property.name] = isNewValueValid
                self.barButtonShouldBeEnabled()
                return isNewValueValid
            })
    }

    private func cellForPhoneNumber(tableView: UITableView, indexPath: IndexPath, currentEntity: ESPMContainerFmwk.Customer, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.phoneNumber {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler:
            { (newValue: String) -> Bool in
                var isNewValueValid = false
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.phoneNumber = nil
                    isNewValueValid = true
                } else {
                    if Customer.phoneNumber.isOptional || newValue != "" {
                        currentEntity.phoneNumber = newValue
                        isNewValueValid = true
                    }
                }
                self.validity[property.name] = isNewValueValid
                self.barButtonShouldBeEnabled()
                return isNewValueValid
            })
    }

    private func cellForPostalCode(tableView: UITableView, indexPath: IndexPath, currentEntity: ESPMContainerFmwk.Customer, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.postalCode {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler:
            { (newValue: String) -> Bool in
                var isNewValueValid = false
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.postalCode = nil
                    isNewValueValid = true
                } else {
                    if Customer.postalCode.isOptional || newValue != "" {
                        currentEntity.postalCode = newValue
                        isNewValueValid = true
                    }
                }
                self.validity[property.name] = isNewValueValid
                self.barButtonShouldBeEnabled()
                return isNewValueValid
            })
    }

    private func cellForStreet(tableView: UITableView, indexPath: IndexPath, currentEntity: ESPMContainerFmwk.Customer, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.street {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler:
            { (newValue: String) -> Bool in
                var isNewValueValid = false
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.street = nil
                    isNewValueValid = true
                } else {
                    if Customer.street.isOptional || newValue != "" {
                        currentEntity.street = newValue
                        isNewValueValid = true
                    }
                }
                self.validity[property.name] = isNewValueValid
                self.barButtonShouldBeEnabled()
                return isNewValueValid
            })
    }

    private func cellForUpdatedTimestamp(tableView: UITableView, indexPath: IndexPath, currentEntity: ESPMContainerFmwk.Customer, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.updatedTimestamp {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: entity, property: property, value: value, editingIsAllowed: allowsEditableCells, changeHandler:
            { (newValue: String) -> Bool in
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
        showFioriLoadingIndicator()
        view.endEditing(true)
        logger.info("Creating entity in backend.")
        dataService.createEntity(entity) { error in
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

    func createEntityWithDefaultValues() -> ESPMContainerFmwk.Customer {
        let newEntity = ESPMContainerFmwk.Customer()

        // Key properties without default value should be invalid by default for Create scenario
        if newEntity.customerID == nil || newEntity.customerID!.isEmpty {
            validity["CustomerId"] = false
        }

        barButtonShouldBeEnabled()
        return newEntity
    }

    @objc func updateEntity(_: AnyObject) {
        showFioriLoadingIndicator()
        view.endEditing(true)
        logger.info("Updating entity in backend.")
        dataService.updateEntity(entity) { error in
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
        let anyFieldInvalid = validity.values.first { field in
            field == false
        }
        navigationItem.rightBarButtonItem?.isEnabled = anyFieldInvalid == nil
    }
}

extension CustomerDetailViewController: ESPMContainerEntityUpdaterDelegate {
    func entityHasChanged(_ entityValue: EntityValue?) {
        if let entity = entityValue {
            let currentEntity = entity as! ESPMContainerFmwk.Customer
            self.entity = currentEntity
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
}
