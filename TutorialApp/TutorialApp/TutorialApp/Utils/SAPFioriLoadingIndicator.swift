//
// TutorialApp
//
// Created by SAP BTP SDK Assistant for iOS application on 08/09/21
//

import Foundation
import SAPFiori

protocol SAPFioriLoadingIndicator: AnyObject {
    var loadingIndicator: FUILoadingIndicatorView? { get set }
}

extension SAPFioriLoadingIndicator where Self: UIViewController {
    func showFioriLoadingIndicator(_ message: String = "") {
        DispatchQueue.main.async {
            let indicator = FUILoadingIndicatorView(frame: self.view.frame)
            indicator.text = message
            self.view.addSubview(indicator)
            indicator.show()
            self.loadingIndicator = indicator
        }
    }

    func hideFioriLoadingIndicator() {
        DispatchQueue.main.async {
            guard let loadingIndicator = self.loadingIndicator else {
                return
            }
            loadingIndicator.dismiss()
        }
    }
}
