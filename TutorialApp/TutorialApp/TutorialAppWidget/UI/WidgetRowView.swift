//
// TutorialApp
//
// Created by SAP BTP SDK Assistant for iOS application on 12/07/21
//

import Foundation
import SwiftUI

struct WidgetRowView: View {
    var model: WidgetRowViewModel
    var isLastIdx: Bool
    var body: some View {
        VStack(alignment: .leading) {
            if model.image != nil {
                mainContentViewWithImage
            } else {
                mainContentView
            }

            if !isLastIdx {
                Divider()
            } else {
                Divider().hidden()
            }
        }
    }

    var mainContentView: some View {
        VStack(alignment: .leading) {
            Text(model.value)
                .font(.system(size: 18.0))
                .fontWeight(.semibold)
                .foregroundColor(.primary)
                .lineLimit(1)
                .padding(.top, 4)

            Text(model.key)
                .font(.system(size: 16.0))
                .foregroundColor(.secondary)
                .lineLimit(1)
                .padding(.bottom, 4)
        }
    }

    var mainContentViewWithImage: some View {
        HStack(spacing: 16) {
            Image("")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(width: 45.0, height: 45.0)
            mainContentView
        }
    }
}
