import HyperSwift
import JavaScriptKit

class UniqueSection: Section {
    init() {
        super.init(
            title: "Unique",
            ref: "https://github.com/apple/swift-algorithms/blob/main/Guides/Unique.md",
            functions: [
                "uniqued()",
                "uniqued(on:)"
            ],
            subtitle: "Methods to strip repeated elements from a sequence or collection.",
            additionalText: "The <code>uniqued()</code> method returns an array, dropping duplicate elements from a sequence. The <code>uniqued(on:)</code> method does the same, using the result of the given closure to determine the \"uniqueness\" of each element."
        )
    }
}
