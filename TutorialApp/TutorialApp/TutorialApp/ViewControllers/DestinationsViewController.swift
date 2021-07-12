//
// TutorialApp
//
// Created by SAP BTP SDK Assistant for iOS application on 12/07/21
//

import SAPFiori
import SAPFoundation
import UIKit

import SharedFmwk
import WidgetKit

class DestinationsViewController: FUIFormTableViewController {
    let destinations = FileConfigurationProvider("AppParameters").provideConfiguration().configuration["Destinations"] as! NSDictionary
    lazy var odataServiceNames = destinations.allKeys as! [String]

    override func viewDidLoad() {
        super.viewDidLoad()
        WidgetCenter.shared.reloadTimelines(ofKind: AuxiliaryConfiguration.widgetKind)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        Deeplinker.Navigator.shared.check(destination: .none, screen: .destinationList, moveForwardDoing: { dest, _ in
            if let index = self.odataServiceNames.firstIndex(of: dest.description) {
                let indexPath = IndexPath(row: index, section: 0)
                self.handleClick(at: indexPath)
            }
        })
    }

    // MARK: - Table view data source

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return odataServiceNames.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DestinationCell", for: indexPath)
        cell.textLabel?.text = odataServiceNames[indexPath.row]
        return cell
    }

    override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        handleClick(at: indexPath)
    }

    func handleClick(at indexPath: IndexPath) {
        let selectedODataService = odataServiceNames[indexPath.row]
        let collectionStoryBoard = UIStoryboard(name: selectedODataService, bundle: nil)
        let collectionViewController = collectionStoryBoard.instantiateViewController(withIdentifier: "\(selectedODataService)CollectionsView")
        navigationController?.pushViewController(collectionViewController, animated: true)
    }
}
