import HyperSwift
import JavaScriptKit

class RandomSampleSection: Section {
    init() {
        super.init(
            title: "Random Sampling",
            ref: "https://github.com/apple/swift-algorithms/blob/main/Guides/RandomSampling.md",
            functions: [
                "randomSample(count: )",
                "randomStableSample(count: )",
                "randomSample(count:, using: &)"
            ],
            subtitle: "Operations for randomly selecting <code>k</code> elements without replacement from a sequence or collection.",
            additionalText: "Use these methods for sampling multiple elements from a collection, optionally maintaining the relative order of the elements. Each method has an overload that takes a <code>RandomNumberGenerator</code> as a parameter."
        )
    }
}
