//
// TutorialApp
//
// Created by SAP BTP SDK Assistant for iOS application on 08/09/21
//

import SAPCommon
import SAPFiori
import SAPOfflineOData

class OfflineODataDelegateSample: OfflineODataProviderDelegate {
    private let banner: FUIBannerMessageView?
    private let logger: Logger

    init(for serviceName: String, with banner: FUIBannerMessageView?) {
        self.banner = banner
        self.logger = Logger.shared(named: serviceName + "OfflineODataController")
    }

    func offlineODataProvider(_: OfflineODataProvider, didUpdateOpenProgress progress: OfflineODataProviderOperationProgress) {
        self.progressBarUIBanner(of: LocalizedStrings.OfflineOData.openingOfflineStoreMessage, progress: progress)
        self.logger.info("openProgress: \(progress.defaultMessage)")
        self.logger.info("openProgressStep: \(progress.currentStepNumber) of \(progress.totalNumberOfSteps)")
    }

    func offlineODataProvider(_: OfflineODataProvider, didUpdateDownloadProgress progress: OfflineODataProviderDownloadProgress) {
        self.progressBarUIBanner(of: LocalizedStrings.OfflineOData.updatingLocalDataMessage, progress: progress)
        self.logger.info("downloadProgress: \(progress.defaultMessage)")
        self.logger.info("downloadProgressStep: \(progress.currentStepNumber) of \(progress.totalNumberOfSteps)")
    }

    func offlineODataProvider(_: OfflineODataProvider, didUpdateUploadProgress progress: OfflineODataProviderOperationProgress) {
        self.progressBarUIBanner(of: LocalizedStrings.OfflineOData.uploadingLocalDataMessage, progress: progress)
        self.logger.info("uploadProgress: \(progress.defaultMessage)")
        self.logger.info("uploadProgressStep: \(progress.currentStepNumber) of \(progress.totalNumberOfSteps)")
    }

    func offlineODataProvider(_: OfflineODataProvider, requestDidFail request: OfflineODataFailedRequest) {
        self.logger.info("requestFailed: \(request.httpStatusCode)")
    }

    func offlineODataProvider(_: OfflineODataProvider, didUpdateSendStoreProgress progress: OfflineODataProviderOperationProgress) {
        self.progressBarUIBanner(of: LocalizedStrings.OfflineOData.sendingOfflineStoreMessage, progress: progress)
        self.logger.info("sendStoreProgress: \(progress.defaultMessage)")
        self.logger.info("sendStoreProgressStep: \(progress.currentStepNumber) of \(progress.totalNumberOfSteps)")
    }

    private func progressBarUIBanner(of activity: String, progress: OfflineODataProviderProgressReporting) {
        DispatchQueue.main.async {
            if let topBanner = self.banner {
                topBanner.titleLabel.text = "\(activity): \(String(format: "%.0f", (Double(progress.currentStepNumber) / Double(progress.totalNumberOfSteps)) * 100))%"
            }
        }
    }
}
