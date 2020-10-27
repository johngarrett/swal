import HyperSwift
import JavaScriptKit

class ChainSection: Section {
    init() {
        super.init(
            title: "Chain",
            ref: "https://github.com/apple/swift-algorithms/blob/main/Guides/Chain.md",
            functions: ["chain(_:_:)"],
            subtitle: "Concatenates two collections with the same element type, one after another.<br>This operation is available for any two sequences",
            additionalText: "Unlike placing two collections in an array and calling <code>joined()</code>, chaining permits different collection types, performs no allocations, and can preserve the shared conformances of the two underlying types."
        )
    }
}
