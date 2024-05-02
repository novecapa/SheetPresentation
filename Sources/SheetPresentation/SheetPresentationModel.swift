//
//  SheetPresentationModel.swift
//  SheetPresentation
//
//  Created by Josep Cerdá Penadés on 2/5/24.
//

import Foundation
import SwiftUI

public struct SheetPresentationModel {
    public let detents: [UISheetPresentationController.Detent]
    public let prefersGrabberVisible: Bool
    public let preferredCornerRadius: CGFloat
    public let delegate: SheetPresentationProtocol
}
