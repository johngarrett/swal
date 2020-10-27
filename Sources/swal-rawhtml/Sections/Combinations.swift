import HyperSwift
import JavaScriptKit

class Combinations: Section {
    var combinationCount: Int = 1 {
        didSet { updateElements() }
    }
    var inputArray: [Int] = [1, 2, 3, 4] {
        didSet { updateElements() }
    }

    lazy var updateCombinationCount = JSClosure { _ in
        self.combinationCount = Int(element(Element.countInput.rawValue)?.value.string ?? "1") ?? 1
    }
    
    lazy var updateCombinationInput = JSClosure { _ in
        self.inputArray = Array(from: element(Element.arrayInput.rawValue)?.value.string ?? "")
    }
    
    enum Element: String {
        case countInput = "combo-count-input",
             arrayInput = "combo-array-input",
             comboOutput = "combo-output"
    }

    init() {
        super.init(
            title: "Combinations",
            ref: "https://github.com/apple/swift-algorithms/blob/main/Guides/Combinations.md",
            functions: ["combinations(ofCount: )"],
            subtitle: "A type that computes combinations of a collection's elements.",
            additionalText: "This method returns a sequence of all the different combinations of a collection's elements, with each combination in the order of the original collection."
        )
    }
    
    override internal func updateElements() {
        element(Element.arrayInput.rawValue)?.onchange = .function(updateCombinationInput)
        element(Element.countInput.rawValue)?.onchange = .function(updateCombinationCount)
        element(Element.comboOutput.rawValue)?.innerHTML = Paragraph(inputArray
            .combinations(ofCount: combinationCount)
            .map { $0.description }
            .joined(separator: "<br>")
        ).margin(0).render().jsValue()
        element(Element.arrayInput.rawValue)?.value = inputArray.description.jsValue()
        element(Element.countInput.rawValue)?.value = combinationCount.jsValue()
        element(Element.countInput.rawValue)?.max = inputArray.count.jsValue()
    }
    
    override internal func buildInputArea() -> HTMLElement {
        ResultPane(
            input: VStack {
                HStack(align: .center) {
                    Paragraph("array:")
                    Input(type: .string, id: Element.arrayInput.rawValue)
                }
                HStack(align: .center) {
                    Paragraph("count:")
                    Input(
                        type: .number,
                        id: Element.countInput.rawValue,
                        value: inputArray.description,
                        min: "0",
                        max: "\(combinationCount)"
                    )
                }
            },
            outputText: "",
            outputId: Element.comboOutput.rawValue
        )
    }
}
