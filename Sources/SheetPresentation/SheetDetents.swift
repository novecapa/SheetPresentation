//
//  SheetDetents.swift
//  SheetPresentation
//
//  Created by Josep Cerdá Penadés on 2/5/24.
//

import Foundation
import SwiftUI

public struct SheetDetents: CustomPresentationDetent {
    static func height(in context: Context) -> CGFloat? {
        return context.maxDetentValue * 0.6
    }
}
