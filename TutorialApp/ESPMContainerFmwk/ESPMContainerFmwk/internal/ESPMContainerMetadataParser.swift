// # Proxy Compiler 21.5.2

import Foundation
import SAPOData

internal class ESPMContainerMetadataParser {
    internal static let options: Int = (CSDLOption.allowCaseConflicts | CSDLOption.disableFacetWarnings | CSDLOption.disableNameValidation | CSDLOption.processMixedVersions | CSDLOption.synthesizeTargetSets | CSDLOption.ignoreUndefinedTerms)

    internal static let parsed: CSDLDocument = xs_immortalize(ESPMContainerMetadataParser.parse())

    static func parse() -> CSDLDocument {
        let parser = CSDLParser()
        parser.logWarnings = false
        parser.csdlOptions = ESPMContainerMetadataParser.options
        let metadata = parser.parseInProxy(ESPMContainerMetadataText.xml, url: "ESPM")
        metadata.proxyVersion = "21.5.2"
        return metadata
    }
}
