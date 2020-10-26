import JavaScriptKit
import Algorithms

func element(_ id: String) -> JSObject? {
    JSObject.global.document.object?.getElementById?(id).object
}

// combinations
var combInput = [1, 2, 3, 4] {
    didSet { renderCombinations() }
}
var combCount = 1 {
    didSet { renderCombinations() }
}

func renderCombinations() {
    element("combo-output")?.innerHTML = combInput
        .combinations(ofCount: combCount)
        .map { $0.description }
        .joined(separator: "<br>")
        .jsValue()
    element("combo-array-input")?.value = combInput.description.jsValue()
    element("combo-count-input")?.value = combCount.jsValue()
    element("combo-count-input")?.max = combInput.count.jsValue()
}


let updateCombinationCount = JSClosure { _ in
    combCount = Int(element("combo-count-input")?.value.string ?? "1") ?? 1
}

let updateCombinationInput = JSClosure { _ in
    combInput = Array(from: element("combo-array-input")?.value.string ?? "")
}

element("combo-array-input")?.onchange = .function(updateCombinationInput)
element("combo-count-input")?.onchange = .function(updateCombinationCount)
renderCombinations()

// permutations
var permInput = [1, 2, 3, 4] {
    didSet { renderPermutations() }
}
var permCount = 1 {
    didSet { renderPermutations() }
}

func renderPermutations() {
    element("permute-output")?.innerHTML = permInput
        .permutations(ofCount: permCount)
        .map { $0.description }
        .joined(separator: "<br>")
        .jsValue()
    element("permute-array-input")?.value = permInput.description.jsValue()
    element("permute-count-input")?.value = permCount.jsValue()
    element("permute-count-input")?.max = permInput.count.jsValue()
}

let updatePermuteCount = JSClosure { _ in
    permCount = Int(element("permute-count-input")?.value.string ?? "1") ?? 1
}

let updatePermuteInput = JSClosure { _ in
    permInput = Array(from: element("permute-array-input")?.value.string ?? "")
}

element("permute-array-input")?.onchange = .function(updatePermuteInput)
element("permute-count-input")?.onchange = .function(updatePermuteCount)
renderPermutations()


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
