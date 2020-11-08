import HyperSwift
import Algorithms
import JavaScriptKit

class ProductSection: Section {
    enum Element: String {
        case sequenceInput = "product-sequence-input",
             collectionInput = "product-collection-input",
             output = "product-output",
             outputTitle = "product-output-title"
    }
    
    var collection = ["winter", "spring", "summer", "fall"] { didSet { updateElements() } }
    var sequence = 1900...2000 { didSet { updateElements() } }
    
    init() {
        super.init(
            title: "Product",
            ref: "https://github.com/apple/swift-algorithms/blob/main/Guides/Product.md",
            functions: [ "product(_:_:)" ],
            subtitle: "A function for iterating over every pair of elements in two different collections.",
            additionalText: "When either collection is empty, the resulting wrapper collection is also empty."
        )
    }
    
    lazy var updateSequence = JSClosure { _ in
        self.sequence = ClosedRange<Int>(from: element(Element.sequenceInput.rawValue)?.value.string ?? "")
    }
    
    lazy var updateCollection = JSClosure { _ in
        self.collection = Array(from: element(Element.collectionInput.rawValue)?.value.string ?? "")
    }
    
    var productResult: String {
        Dictionary.init(grouping: product(sequence, collection), by: { $0.0 }) // group by like sequence values
            .sorted(by: { $0.key < $1.key }) // sort descinding
            .map { index, row in
                row.map { "(\($0.0), \($0.1))" } // print each tuple as (#, #)
                    .joined(separator: " ")
            }.joined(separator: "<br>")
    }

    override internal func updateElements() {
        element(Element.sequenceInput.rawValue)?.value = sequence.description.jsValue()
        element(Element.sequenceInput.rawValue)?.onchange = .function(updateSequence)
        element(Element.collectionInput.rawValue)?.value = collection.description.jsValue()
        element(Element.collectionInput.rawValue)?.onchange = .function(updateCollection)
        element(Element.output.rawValue)?.innerHTML = Paragraph(productResult).margin(0).render().jsValue()
        element(Element.outputTitle.rawValue)?.innerHTML = Code(
            "product(\(sequence.description), \(collection.description))"
        ).render().jsValue()
    }
    
    override internal func buildInputArea() -> HTMLElement {
        ResultPane(
            input: VStack {
                HStack(justify: .spaceBetween, align: .center) {
                    Paragraph("sequence (Int...Int):")
                    Input(type: .string, id: Element.sequenceInput.rawValue)
                }
                HStack(justify: .spaceBetween, align: .center) {
                    Paragraph("collection:")
                    Input(type: .string, id: Element.collectionInput.rawValue)
                        .rawCSS("flex", "1")
                }
            },
            output: (titleId: Element.outputTitle.rawValue, resultId: Element.output.rawValue)
        )
    }
}
