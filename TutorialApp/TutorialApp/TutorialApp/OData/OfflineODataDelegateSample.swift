//
// TutorialApp
//
// Created by SAP BTP SDK Assistant for iOS v7.0.0 application on 04/01/22
//

import SAPCommon
import SAPFiori
import SAPOfflineOData

class OfflineODataDelegateSample: OfflineODataProviderDelegate {
    private let banner: FUIBannerMessageView?
    private let logger: Logger

    init(for serviceName: String, with banner: FUIBannerMessageView?) {
        self.banner = banner
        logger = Logger.shared(named: serviceName + "OfflineODataController")
    }

    func offlineODataProvider(_: OfflineODataProvider, didUpdateOpenProgress progress: OfflineODataProviderOperationProgress) {
        progressBarUIBanner(of: LocalizedStrings.OfflineOData.openingOfflineStoreMessage, progress: progress)
        logger.info("openProgress: \(progress.defaultMessage)")
        logger.info("openProgressStep: \(progress.currentStepNumber) of \(progress.totalNumberOfSteps)")
    }

    func offlineODataProvider(_: OfflineODataProvider, didUpdateDownloadProgress progress: OfflineODataProviderDownloadProgress) {
        progressBarUIBanner(of: LocalizedStrings.OfflineOData.updatingLocalDataMessage, progress: progress)
        logger.info("downloadProgress: \(progress.defaultMessage)")
        logger.info("downloadProgressStep: \(progress.currentStepNumber) of \(progress.totalNumberOfSteps)")
    }

    func offlineODataProvider(_: OfflineODataProvider, didUpdateUploadProgress progress: OfflineODataProviderOperationProgress) {
        progressBarUIBanner(of: LocalizedStrings.OfflineOData.uploadingLocalDataMessage, progress: progress)
        logger.info("uploadProgress: \(progress.defaultMessage)")
        logger.info("uploadProgressStep: \(progress.currentStepNumber) of \(progress.totalNumberOfSteps)")
    }

    func offlineODataProvider(_: OfflineODataProvider, requestDidFail request: OfflineODataFailedRequest) {
        logger.info("requestFailed: \(request.httpStatusCode)")
    }

    func offlineODataProvider(_: OfflineODataProvider, didUpdateSendStoreProgress progress: OfflineODataProviderOperationProgress) {
        progressBarUIBanner(of: LocalizedStrings.OfflineOData.sendingOfflineStoreMessage, progress: progress)
        logger.info("sendStoreProgress: \(progress.defaultMessage)")
        logger.info("sendStoreProgressStep: \(progress.currentStepNumber) of \(progress.totalNumberOfSteps)")
    }

    private func progressBarUIBanner(of activity: String, progress: OfflineODataProviderProgressReporting) {
        DispatchQueue.main.async {
            if let topBanner = self.banner {
                topBanner.titleLabel.text = "\(activity): \(String(format: "%.0f", (Double(progress.currentStepNumber) / Double(progress.totalNumberOfSteps)) * 100))%"
            }
        }
    }
}
