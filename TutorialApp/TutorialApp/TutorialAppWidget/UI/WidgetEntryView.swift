//
// TutorialApp
//
// Created by SAP BTP SDK Assistant for iOS application on 12/07/21
//

import SharedFmwk
import SwiftUI
import WidgetKit

struct WidgetEntryView: View {
    let data: [WidgetRowViewModel]
    let title: String
    let resourceURL: URL

    init(data: [WidgetRowViewModel], title: String, listPath: String) {
        self.data = data
        self.title = title

        if AuxiliaryOnboardingUtil().isWidgetInitialized() {
            resourceURL = URL(string: "\(AuxiliaryConfiguration.scheme)://\(listPath)/action=view")!
        } else {
            resourceURL = URL(string: "\(AuxiliaryConfiguration.scheme)://")!
        }
        print("resourceURL: \(resourceURL)")
    }

    var body: some View {
        // Show UI as per onboarding status
        if AuxiliaryOnboardingUtil().isWidgetInitialized() {
            loggedInView
                .widgetURL(resourceURL)
        } else {
            loginView
                .widgetURL(resourceURL)
        }
    }

    var loginView: some View {
        LoginView()
    }

    var loggedInView: some View {
        VStack(alignment: .leading) {
            headerView

            Divider()

            if !data.isEmpty {
                listView
                Divider()
            } else {
                noDataView
            }

            Spacer()
        }
    }

    var noDataView: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                Text("No data")
                    .font(.system(size: 20.0))
                    .fontWeight(.regular)
                    .foregroundColor(.secondary)
                Spacer()
            }
            Spacer()
        }
    }

    var headerView: some View {
        VStack {
            Text(title)
                .font(.system(size: 18.0))
                .fontWeight(.bold)
                .foregroundColor(.primary)
        }
        .padding([.leading, .top], 16)
    }

    var listView: some View {
        VStack {
            ForEach(0 ..< data.count) { idx in
                WidgetRowView(model: data[idx], isLastIdx: idx == data.count - 1)
            }
        }
        .padding([.leading, .trailing], 16)
    }
}
