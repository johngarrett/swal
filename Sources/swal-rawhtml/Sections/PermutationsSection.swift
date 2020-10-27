import HyperSwift
import JavaScriptKit

class PermutationsSection: Section {
    var permutationCount: Int = 1 {
        didSet { updateElements() }
    }
    var inputArray: [Int] = [1, 2, 3, 4] {
        didSet { updateElements() }
    }
    
    lazy var updatepermutationCount = JSClosure { _ in
        self.permutationCount = Int(element(Element.countInput.rawValue)?.value.string ?? "1") ?? 1
    }
    
    lazy var updateCombinationInput = JSClosure { _ in
        self.inputArray = Array(from: element(Element.arrayInput.rawValue)?.value.string ?? "")
    }
    
    enum Element: String {
        case countInput = "perm-count-input",
             arrayInput = "perm-array-input",
             output = "perm-output"
    }
    
    public init() {
        super.init(
            title: "Permutations",
            ref: "https://github.com/apple/swift-algorithms/blob/main/Guides/Permutations.md",
            functions: ["permutations(ofCount: )"],
            subtitle: "A type that computes permutations of a collection's elements, or of a subset of those elements.",
            additionalText: "This method, when called without the ofCount parameter, returns a sequence of all the different permutations of a collection's elements"
        )
    }
    
    override internal func updateElements() {
        element(Element.arrayInput.rawValue)?.onchange = .function(updateCombinationInput)
        element(Element.countInput.rawValue)?.onchange = .function(updatepermutationCount)
        element(Element.output.rawValue)?.innerHTML = Paragraph(inputArray
            .permutations(ofCount: permutationCount)
            .map { $0.description }
            .joined(separator: "<br>")
        ).margin(0).render().jsValue()
        element(Element.arrayInput.rawValue)?.value = inputArray.description.jsValue()
        element(Element.countInput.rawValue)?.value = permutationCount.jsValue()
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
                        max: "\(permutationCount)"
                    )
                }
            },
            outputText: "",
            outputId: Element.output.rawValue
        )
    }
}
