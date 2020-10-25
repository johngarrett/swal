import JavaScriptKit
import Algorithms

func element(_ id: String) -> JSObject? {
    JSObject.global.document.object?.getElementById?(id).object
}

// combinations
var cInput = [1, 2, 3, 4]
let combinations = { (value: JSValue?) -> JSValue in
    guard let value = value, let stringValue = value.string, let count = Int(stringValue) else {
        return "Error parsing input".jsValue()
    }
    return cInput.combinations(ofCount: count).map { $0.description }.joined(separator: "<br>").jsValue()
}

element("combo-array-input")?.value = cInput.description.jsValue()
element("combo-output")?.innerHTML = combinations(element("combo-count-input")?.value)

let updateCombinationCount = JSClosure { _ in
    element("combo-output")?.innerHTML = combinations(element("combo-count-input")?.value)
}
let updateCombinationInput = JSClosure { _ in
    cInput = Array(from: element("combo-array-input")?.value.string ?? "error")
}

element("combo-count-input")?.onchange = .function(updateCombinationCount)
element("combo-array-input")?.onchange = .function(updateCombinationInput)

// permutations
var pInput = [1, 2, 3, 4]

let permutations = { (value: JSValue?) -> JSValue in
    guard let value = value, let stringValue = value.string, let count = Int(stringValue) else {
        return "Error parsing input".jsValue()
    }
    return pInput.permutations(ofCount: count).map { $0.description }.joined(separator: "<br>").jsValue()
}

element("permute-array-input")?.value = pInput.description.jsValue()
element("permute-count-input")?.value = 1.jsValue()
element("permute-output")?.innerHTML = permutations(element("permute-count-input")?.value)

let updatePermuteCount = JSClosure { _ in
    element("permute-output")?.innerHTML = combinations(element("permute-count-input")?.value)
}

let updatePermuteInput = JSClosure { _ in
    pInput = Array(from: element("permute-array-input")?.value.string ?? "")
}

element("permute-array-input")?.onchange = .function(updatePermuteInput)
element("permute-count-input")?.onchange = .function(updatePermuteCount)
