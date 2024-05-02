//
//  SheetPresentation.swift
//  SheetPresentation
//
//  Created by Josep Cerdá Penadés on 2/5/24.
//

import Foundation
import SwiftUI

extension View {
    func halfSheet<SheetView: View>(showSheet: Binding<Bool>,
                                    model: SheetPresentationModel,
                                    @ViewBuilder sheeView: @escaping () -> SheetView) -> some View {
        return background {
            SheetPresentation(sheetView: sheeView(),
                              showSheet: showSheet,
                              model: model)
        }
    }
}

struct SheetPresentation<SheetView: View>: UIViewControllerRepresentable {

    var sheetView: SheetView
    @Binding var showSheet: Bool
    let model: SheetPresentationModel
    let controller = UIViewController()

    func makeUIViewController(context: Context) -> UIViewController {
        controller.view.backgroundColor = .clear
        return controller
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if showSheet {
            if uiViewController.presentedViewController == nil {
                let sheetViewController = CustomHostingController(rootView: sheetView, model: model)
                uiViewController.present(sheetViewController, animated: true)
            }
        } else {
            uiViewController.dismiss(animated: true)
        }
    }
}

class CustomHostingController<Content: View>: UIHostingController<Content> {

    let model: SheetPresentationModel
    init(rootView: Content, model: SheetPresentationModel) {
        self.model = model
        super.init(rootView: rootView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        if let sheetPresentationController = self.sheetPresentationController {
            sheetPresentationController.detents = model.detents
            sheetPresentationController.prefersGrabberVisible = model.prefersGrabberVisible
            sheetPresentationController.prefersScrollingExpandsWhenScrolledToEdge = false
            sheetPresentationController.preferredCornerRadius = model.preferredCornerRadius
            sheetPresentationController.largestUndimmedDetentIdentifier = .medium
        } else {
            self.modalPresentationStyle = .popover
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        model.delegate.dismissSheetView()
    }
}