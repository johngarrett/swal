import HyperSwift
import JavaScriptKit

class IndexedSection: Section {
    init() {
        super.init(
            title: "Indexed",
            ref: "https://github.com/apple/swift-algorithms/blob/main/Guides/Indexed.md",
            functions: ["indexed()"],
            subtitle: "The <code>enumerated</code> method, but pairing each element with its index instead of an incrementing integer counter.",
            additionalText: "This is essentially equivalent to <code>zip(x.indices, x)</code>"
        )
    }
}
