//
//  SheetPresentationModel.swift
//  SheetPresentation
//
//  Created by Josep Cerdá Penadés on 2/5/24.
//

import Foundation
import SwiftUI

struct SheetPresentationModel {
    let detents: [UISheetPresentationController.Detent]
    let prefersGrabberVisible: Bool
    let preferredCornerRadius: CGFloat
    let delegate: SheetPresentationProtocol
}
