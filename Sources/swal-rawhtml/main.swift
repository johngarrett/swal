import JavaScriptKit
import HyperSwift
import Foundation
import Algorithms

func element(_ id: String) -> JSObject? {
    JSObject.global.document.object?.getElementById?(id).object
}

let document = JSObject.global.document
let sections = [Combinations(), PermutationsSection()]

let renderer = StaticRenderer(elements: sections.map { $0.buildElement() })

//document.head.appendChild()

for section in sections {
    var div = document.createElement("div")
    div.innerHTML = section.buildElement().render().jsValue()
    _ = document.object!.getElementById!("content").appendChild(div)
    section.updateElements()
}

// rotation
var rotationInput = [10, 20, 30, 40, 50, 60] {
    didSet { renderRotations() }
}

var rotateTo = 1 {
    didSet {
        print(rotateTo)
        rotationInput.rotate(toStartAt: rotateTo)
    }
}

func renderRotations() {
    //let p = rotationInput.rotate(toStartAt: 2)
    //print(p)
    element("rotate-output")?.innerHTML = rotationInput.jsValue()
    element("rotate-array-input")?.value = rotationInput.description.jsValue()
    element("rotate-to-input")?.value = rotateTo.jsValue()
    element("rotate-to-input")?.min = 0.jsValue()
    element("rotate-to-input")?.max = (rotationInput.count + 1).jsValue()
}

let updateRotateTo = JSClosure { _ in
    rotateTo = Int(element("rotate-to-input")?.value.string ?? "0") ?? 0
}

let updateRotationInput = JSClosure { _ in
    rotationInput = Array(from: element("rotate-array-input")?.value.string ?? "")
}

element("rotate-array-input")?.onchange = .function(updateRotationInput)
element("rotate-to-input")?.onchange = .function(updateRotateTo)
renderRotations()
