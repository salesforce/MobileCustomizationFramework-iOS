# Mobile Customization Framework for iOS

## 📝 Overview

The Mobile Customization Framework (MCF) for iOS is a comprehensive SwiftUI-based framework that enables dynamic, server-driven UI rendering for Salesforce mobile applications. Built entirely with SwiftUI, it provides a flexible architecture for mapping JSON component definitions to native iOS components while maintaining consistency with the Salesforce Lightning Design System.

### Key Features

- **🚀 Server-Driven UI**: Render dynamic interfaces from JSON configurations without app updates
- **🎨 Salesforce Design System**: All components follow Lightning Design System guidelines
- **📱 SwiftUI Native**: Modern iOS development with declarative UI patterns
- **🔧 Extensible Architecture**: Easy to add custom components and view providers
- **🤖 AI Components**: Built-in support for AI-powered features and interactions
- **📊 Data Integration**: GraphQL parsers and query builders for seamless data access
- **🔒 Type-Safe**: Swift-based with strong typing and protocol-oriented design
- **♿️ Accessibility First**: Full VoiceOver support and WCAG compliance
- **🎨 Styling Hooks**: Dynamic theming with server-driven styling tokens

## 🚀 Installation

### Swift Package Manager

Add MobileCustomizationFramework to your project using Swift Package Manager:

```swift
dependencies: [
    .package(url: "https://github.com/salesforce/MobileCustomizationFramework-iOS.git", from: "1.0.0")
]
```

### CocoaPods

Add MobileCustomizationFramework to your `Podfile`:

```ruby
source 'https://github.com/forcedotcom/SalesforceMobileSDK-iOS-Specs.git'

target 'YourApp' do
  use_frameworks!
  pod 'MobileCustomizationFramework', '~> 1.0'
end
```

Then run:

```bash
pod install
```

### Requirements

- iOS 17.0+
- Xcode 15.0+
- Swift 5.9+
- SwiftUI

## 🏗️ Architecture

The framework consists of three main modules:

### 📦 Mobile Customization Components
Basic Salesforce components that can be bound to data using DataProvider implementations.

### 🔧 Mobile Customization Framework
Core framework for mapping layout metadata definitions to MCF components. Includes ViewProvider protocol for component mapping and base implementations for core MCF components.

## 💡 Quick Start Example

```swift
import SwiftUI
import MobileCustomizationFramework

struct MyDynamicView: View {
    let componentDefinition: ComponentDefinition

    var body: some View {
        MCFView(definition: componentDefinition)
            .environment(\.mcfDataProvider, MyDataProvider())
    }
}
```

### Example Layout Metadata JSON Definition

MCF renders UI from layout metadata JSON definitions. Here is an example:

```json
{
  "view": {
    "definition": "generated/uem_ui_example",
    "properties": {},
    "regions": {
      "components": {
        "components": [
          {
            "definition": "ui/container",
            "properties": {
              "backgroundColor": "#f3f2f2",
              "padding": "16"
            },
            "regions": {
              "components": {
                "components": [
                  {
                    "definition": "ui/card",
                    "properties": {},
                    "regions": {
                      "components": {
                        "components": [
                          {
                            "definition": "ui/text",
                            "properties": {
                              "text": "Welcome to MCF",
                              "style": "titlesFontScale3Semibold",
                              "color": "$colors.onSurface1"
                            },
                            "regions": {}
                          },
                          {
                            "definition": "ui/text",
                            "properties": {
                              "text": "Build dynamic, server-driven mobile experiences.",
                              "style": "bodyFontScale2Regular",
                              "color": "$colors.onSurface2"
                            },
                            "regions": {}
                          }
                        ]
                      }
                    }
                  },
                  {
                    "definition": "ui/card",
                    "properties": {},
                    "regions": {
                      "components": {
                        "components": [
                          {
                            "definition": "ui/column",
                            "properties": {
                              "gap": "4",
                              "width": "fill"
                            },
                            "regions": {
                              "components": {
                                "components": [
                                  {
                                    "definition": "ui/button",
                                    "properties": {
                                      "label": "Edit Record",
                                      "variant": "brand",
                                      "iconName": "utility:edit",
                                      "iconPosition": "left"
                                    },
                                    "regions": {}
                                  },
                                  {
                                    "definition": "ui/button",
                                    "properties": {
                                      "label": "View Details",
                                      "variant": "neutral"
                                    },
                                    "regions": {}
                                  }
                                ]
                              }
                            }
                          }
                        ]
                      }
                    }
                  }
                ]
              }
            }
          }
        ]
      }
    }
  },
  "target": "mcf__native",
  "apiName": "uem_ui_example",
  "id": "uem_ui_example"
}
```

## 🎨 Styling Hooks Support

MCF supports comprehensive styling hooks for dynamic theming:

```swift
struct CustomComponent: View {
    let definition: ComponentDefinition

    var body: some View {
        // Clean property access with automatic parsing
        let backgroundColor = definition.getColor("backgroundColor")
        let gap = definition.getDimension("gap")
        let padding = definition.getPaddingValues("padding")

        VStack(spacing: gap) {
            Text("First item")
            Text("Second item")
        }
        .padding(padding)
        .background(backgroundColor)
    }
}
```

### Supported Styling Types

- **Colors**: `$colors.surfaceContainer1`, `#FF0000`
- **Dimensions**: `$spacing.spacing4`, `$sizing.sizing8`, `16`
- **Padding**: `$spacing.spacing4`, `16`, complex padding objects

### Direct StylingHooks Usage

```swift
// Using styling hooks
let backgroundColor = StylingHooks.parseColor(
    "$colors.surfaceContainer1",
    defaultValue: .white
)
let gap = StylingHooks.parseDimension(
    "$spacing.spacing4",
    defaultValue: 8
)
let padding = StylingHooks.parsePadding(
    "$spacing.spacing4",
    defaultValue: EdgeInsets()
)

// Using raw values
let customColor = StylingHooks.parseColor("#FF0000", defaultValue: .black)
let customGap = StylingHooks.parseDimension("16", defaultValue: 8)
```

## 🔌 Extensibility

Add custom components to the framework:

```swift
// 1. Define your custom view provider
struct MyCustomViewProvider: MCFViewProvider {
    func canHandle(definition: String) -> Bool {
        definition == "custom/myComponent"
    }

    func getView(model: ComponentDefinition, componentContext: ComponentContext) -> AnyView {
        AnyView(
            Text(model.properties["title"] as? String ?? "")
        )
    }
}

// 2. Register it with ViewProviderService
let viewProviderService = ViewProviderService()
viewProviderService.register(provider: MyCustomViewProvider())

// 3. Pass it to MCFConfiguration
let configuration = MCFConfiguration(
    viewProvider: viewProviderService
)

// 4. Create the view model with your configuration
let viewModel = MCFRootVM(configuration: configuration)

// 5. Decode layout metadata and assign to the view model
let layoutData = ... // your layout metadata JSON data
let uemRoot = try JSONDecoder().decode(UVMRoot.self, from: layoutData)
viewModel.mcfRoot = uemRoot.view.toComponentDefinition()
viewModel.loadingState = .complete

// 6. Render the metadata in your SwiftUI view
MCFRootView(viewModel: viewModel)
```

## ♿️ Accessibility

All MCF components are built with accessibility as a priority:

- **Dynamic Type**: All text scales appropriately with user preferences
- **VoiceOver**: Comprehensive screen reader support
- **Color Contrast**: WCAG AA compliant color combinations
- **Touch Targets**: Minimum 44x44pt touch targets
- **Semantic Elements**: Proper accessibility traits and labels

## 🧪 Testing

MCF components are designed to be testable:

```swift
import XCTest
import SwiftUI
@testable import MobileCustomizationFramework

final class MCFComponentTests: XCTestCase {
    func testMCFComponent() throws {
        let definition = ComponentDefinition(
            type: "button",
            properties: ["label": "Test Button"]
        )

        let view = MCFView(definition: definition)
        let inspected = try view.inspect()

        XCTAssertNotNil(inspected.find(text: "Test Button"))
    }
}
```

## 📄 License

MobileCustomizationFramework is available under the terms specified in the [TERMS_OF_USE.txt](TERMS_OF_USE.txt) file.

Copyright 2026 Salesforce, Inc. All rights reserved.

## 🤝 Support

For bug reports and feature requests, please use the GitHub Issues section of this repository.

For Salesforce employees: Please refer to internal documentation for contribution guidelines and development setup.

## 🔗 Related Projects

- [SharedUI-iOS](https://github.com/salesforce/SharedUI-iOS) - Salesforce Lightning Design System component library for iOS
- [SLDSIcons-iOS](https://github.com/salesforce/SLDSIcons-iOS) - Salesforce Lightning Design System icon library for iOS

## 📚 Additional Resources

- [Salesforce Lightning Design System](https://www.lightningdesignsystem.com/)

---

**Note**: This library is provided as binary packages for use in mobile applications. See the TERMS_OF_USE.txt for complete details on usage, warranty, and liability.
