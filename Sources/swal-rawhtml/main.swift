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
