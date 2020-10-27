import HyperSwift
import JavaScriptKit

class PartitionSection: Section {
    init() {
        super.init(
            title: "Partition",
            ref: "https://github.com/apple/swift-algorithms/blob/main/Guides/Rotate.md",
            functions: [
                "tablePartition(by:)",
                "partitioningIndex(where:)"
            ],
            subtitle: "The standard library’s existing <code>partition(by:)</code> method, which re-orders the elements in a collection into two partitions based on a given predicate, doesn’t guarantee stability for either partition. That is, the order of the elements in each partition doesn’t necessarily match their relative order in the original collection. These new methods expand on the existing <code>partition(by:)</code> by providing stability for one or both partitions.",
            additionalText: "The <code>partitioningIndex(where:)</code> method returns the index of the start of the second partition when called on an already partitioned collection."
        )
    }
}
