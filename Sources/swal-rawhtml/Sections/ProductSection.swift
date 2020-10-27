import HyperSwift
import JavaScriptKit

class ProductSection: Section {
    init() {
        super.init(
            title: "Product",
            ref: "https://github.com/apple/swift-algorithms/blob/main/Guides/Product.md",
            functions: [ "product(_:_:)" ],
            subtitle: "A function for iterating over every pair of elements in two different collections.",
            additionalText: "When either collection is empty, the resulting wrapper collection is also empty."
        )
    }
}
