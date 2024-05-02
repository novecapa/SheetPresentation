# SheetPresentation

Package to show some View like UIKit presentation

## Instalation

Add this repo to as a Swift Package dependency to your project

``` https://github.com/novecapa/SheetPresentation ```

Current version: v1.0.7

## Usage

To get started, import this library: import SheetPresentation

```swift
import SheetPresentation
import SwiftUI

struct ContentView: View {
    @State private var isSheetPresented = false

    var body: some View {
        Button("Show Sheet") {
            self.isSheetPresented.toggle()
        }
        .halfSheet(showSheet: $isSheetPresented,
                   model: sheetModel) {
            YourView()
        }
    }
}

// MARK: Sheet view model and protocols
extension ContentView: SheetPresentationProtocol {
    var sheetModel: SheetPresentationModel {
        SheetPresentationModel(detents: [.medium()],
                               prefersGrabberVisible: false,
                               preferredCornerRadius: 8,
                               delegate: self)
    }
    func dismissSheetView() {
        isSheetPresented = false
    }
}
```
