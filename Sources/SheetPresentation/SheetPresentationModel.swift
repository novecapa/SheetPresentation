//
//  SheetPresentationModel.swift
//  SheetPresentation
//
//  Created by Josep Cerdá Penadés on 2/5/24.
//

import Foundation
import SwiftUI

public struct SheetPresentationModel {
    let detents: [UISheetPresentationController.Detent]
    let prefersGrabberVisible: Bool
    let preferredCornerRadius: CGFloat
    let delegate: SheetPresentationProtocol

    public init(detents: [UISheetPresentationController.Detent],
                prefersGrabberVisible: Bool,
                preferredCornerRadius: CGFloat,
                delegate: SheetPresentationProtocol) {
        self.detents = detents
        self.prefersGrabberVisible = prefersGrabberVisible
        self.preferredCornerRadius = preferredCornerRadius
        self.delegate = delegate
    }
}
