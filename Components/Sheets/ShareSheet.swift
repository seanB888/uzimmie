//
//  ShareSheet.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 2/7/24.
//

import SwiftUI
import UIKit

struct ShareSheet: UIViewControllerRepresentable {
    var itemsToShare: [Any]

    func makeUIViewController(context: Context) -> UIActivityViewController {
        let activityVC = UIActivityViewController(activityItems: itemsToShare, applicationActivities: nil)
        return activityVC
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}
