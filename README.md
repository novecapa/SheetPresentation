# SheetPresentation

Descripción concisa del propósito y funcionalidades del paquete.

## Instalation

Add this repo to as a Swift Package dependency to your project

``` https://github.com/novecapa/SheetPresentation ```

## Usage

To get started, import this library: import SheetPresentation

```swift
import SwiftUI
import SheetPresentation

struct ContentView: View {
    @State private var isSheetPresented = false

    var body: some View {
        Button("Mostrar Sheet") {
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
