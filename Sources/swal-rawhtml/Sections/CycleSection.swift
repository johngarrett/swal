import HyperSwift
import JavaScriptKit

class CycleSection: Section {
    init() {
        super.init(
            title: "Cycle",
            ref: "https://github.com/apple/swift-algorithms/blob/main/Guides/Cycle.md",
            functions: [ "cycled(times:)" ],
            subtitle: "This combines two other existing standard library functions (<code>repeatElement</code> and <code>joined</code>) to provide a more expressive way of repeating a collection's elements a limited number of times.",
            additionalText: ""
        )
    }
}
