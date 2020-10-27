import HyperSwift
import JavaScriptKit

class ChunkedSection: Section {
    init() {
        super.init(
            title: "Chunked",
            ref: "https://github.com/apple/swift-algorithms/blob/main/Guides/Chunked.md",
            functions: [
                "chunked(by:)",
                "chunked(on:)"
            ],
            subtitle: "Break a collection into subsequences where consecutive elements pass a binary predicate, or where all elements in each chunk project to the same value.",
            additionalText: """
                <code>chunked(by:)</code> uses a binary predicate to test consecutive elements, separating chunks where the predicate returns false.
                <br>
                <code>chunk(on:)</code>, by contrast, takes a projection of each element and separates chunks where the projection of two consecutive elements is not equal.
            """
        )
    }
}
