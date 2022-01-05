//
//  AppDelegate+MenuBuilder.swift
//  TutorialApp
//
//  Created by Muessig, Kevin on 05.01.22.
//  Copyright © 2022 SAP. All rights reserved.
//

import UIKit

extension AppDelegate {
    // MARK: - Mac Catalyst Menu Bar
    override func buildMenu(with builder: UIMenuBuilder) {
        super.buildMenu(with: builder)

        // Remove the Format menu because this is not needed for this app.
        builder.remove(menu: .format)

        // Create an menu item and give it a selector method from some class. In this case OverviewTableViewController.
        let reloadMenuItem = UIKeyCommand(title: NSLocalizedString("Synchronize...", comment: ""),
                                             action: #selector(OverviewTableViewController.loadData),
                                             input: "r",
                                             modifierFlags: .command)

        // Create a Menu and add it an identifier, also define that it should be shown in line. Give it the menu item as children. You could add far more items here if you wanted to.
        let reloadDataMenu = UIMenu(title: "",
                                    image: nil,
                                    identifier: UIMenu.Identifier("com.sap.example.MySampleAppCatalyst.Synchronize"),
                                    options: .displayInline,
                                    children: [reloadMenuItem])

        // Tell the UIMenuBuilder where to insert the menu.
        builder.insertChild(reloadDataMenu, atEndOfMenu: .file)
    }
}
