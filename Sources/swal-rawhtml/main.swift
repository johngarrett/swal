import JavaScriptKit
import HyperSwift
import Foundation
import Algorithms

func element(_ id: String) -> JSObject? {
    JSObject.global.document.object?.getElementById?(id).object
}

let document = JSObject.global.document
let sections = [
    CombinationSection(),
    PermutationSection(),
    RotationSection(),
    PartitionSection(),
    ChainSection(),
    ProductSection(),
    CycleSection(),
    RandomSampleSection(),
    UniqueSection(),
    ChunkedSection(),
    IndexedSection()
]

let renderer = StaticRenderer(elements: sections.map { $0.buildElement() })

for section in sections {
    var div = document.createElement("div")
    div.innerHTML = section.buildElement().render().jsValue()
    _ = document.object!.getElementById!("content").appendChild(div)
    section.updateElements()
}
