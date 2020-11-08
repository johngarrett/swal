import HyperSwift
import Algorithms
import JavaScriptKit

class ChainSection: Section {
    enum Element: String {
        case lhsInput = "chain-lhs-input",
             rhsInput = "chain-rhs-input",
             output = "chain-output",
             outputTitle = "chain-output-title"
    }
    
    var lhsArray = [1, 2, 3] { didSet { updateElements() } }
    var rhsArray = [4, 5, 6] { didSet { updateElements() } }
    
    init() {
        super.init(
            title: "Chain",
            ref: "https://github.com/apple/swift-algorithms/blob/main/Guides/Chain.md",
            functions: ["chain(_:_:)"],
            subtitle: "Concatenates two collections with the same element type, one after another.<br>This operation is available for any two sequences",
            additionalText: "Unlike placing two collections in an array and calling <code>joined()</code>, chaining permits different collection types, performs no allocations, and can preserve the shared conformances of the two underlying types."
        )
    }
    
    lazy var updateLhs = JSClosure { _ in
        self.lhsArray = Array(from: element(Element.lhsInput.rawValue)?.value.string ?? "")
    }
    
    lazy var updateRhs = JSClosure { _ in
        self.rhsArray = Array(from: element(Element.rhsInput.rawValue)?.value.string ?? "")
    }
    
    var chainedResult: String {
        Array(chain(lhsArray, rhsArray)).description
    }
    
    override internal func updateElements() {
        element(Element.lhsInput.rawValue)?.value = lhsArray.description.jsValue()
        element(Element.lhsInput.rawValue)?.onchange = .function(updateLhs)
        element(Element.rhsInput.rawValue)?.value = rhsArray.description.jsValue()
        element(Element.rhsInput.rawValue)?.onchange = .function(updateRhs)
        element(Element.output.rawValue)?.innerHTML = Paragraph(chainedResult).margin(0).render().jsValue()
        element(Element.outputTitle.rawValue)?.innerHTML = Code("chain(\(lhsArray.description), \(rhsArray.description))").render().jsValue()
    }
    
    override internal func buildInputArea() -> HTMLElement {
        ResultPane(
            input: VStack {
                HStack(justify: .spaceBetween, align: .center) {
                    Paragraph("left hand array:")
                    Input(type: .string, id: Element.lhsInput.rawValue)
                }
                HStack(justify: .spaceBetween, align: .center) {
                    Paragraph("right hand array:")
                    Input(type: .string, id: Element.rhsInput.rawValue)
                }
            },
            output: (titleId: Element.outputTitle.rawValue, resultId: Element.output.rawValue)
        )
    }
}
