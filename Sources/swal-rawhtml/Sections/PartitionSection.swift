import HyperSwift
import JavaScriptKit

class PartitionSection: Section {
    enum Element: String {
        case arrayInput = "partition-array-input",
             multipleOfInput = "partition-multiple-of-input",
             output = "partition-output",
             outputTitle = "partition-output-title"
    }
    
    var inputArray: [Int] = [10, 20, 30, 42, 12, 91, 15] {
        didSet {
            multipleOf = 1
            updateElements()
        }
    }
    
    lazy var partitionedArray: [Int] = inputArray {
        didSet { updateElements() }
    }
    
    var partitionIndex: Int = 0 {
        didSet { updateElements() }
    }
    
    var multipleOf: Int = 1 {
        didSet {
            partitionedArray = inputArray.map { $0 }
            partitionIndex = partitionedArray.stablePartition(by: { $0.isMultiple(of: multipleOf) } )
            updateElements()
        }
    }
    

    lazy var updateMultipleOf = JSClosure { _ in
        self.multipleOf = Int(element(Element.multipleOfInput.rawValue)?.value.string ?? "1") ?? 1
    }
    
    lazy var updateSourceArray = JSClosure { _ in
        self.inputArray = Array(from: element(Element.arrayInput.rawValue)?.value.string ?? "")
    }

    init() {
        super.init(
            title: "Partition",
            ref: "https://github.com/apple/swift-algorithms/blob/main/Guides/Partition.md",
            functions: [
                "tablePartition(by:)",
                "partitioningIndex(where:)"
            ],
            subtitle: "The standard library’s existing <code>partition(by:)</code> method, which re-orders the elements in a collection into two partitions based on a given predicate, doesn’t guarantee stability for either partition. That is, the order of the elements in each partition doesn’t necessarily match their relative order in the original collection. These new methods expand on the existing <code>partition(by:)</code> by providing stability for one or both partitions.",
            additionalText: "The <code>partitioningIndex(where:)</code> method returns the index of the start of the second partition when called on an already partitioned collection."
        )
    }
    
    override internal func updateElements() {
        element(Element.arrayInput.rawValue)?.value = inputArray.description.jsValue()
        element(Element.arrayInput.rawValue)?.onchange = .function(updateSourceArray)
        element(Element.multipleOfInput.rawValue)?.value = multipleOf.description.jsValue()
        element(Element.multipleOfInput.rawValue)?.onchange = .function(updateMultipleOf)
        element(Element.output.rawValue)?.innerHTML = Div {
            Paragraph("""
                \(partitionedArray.prefix(upTo: partitionIndex))
                <br>
                \(partitionedArray.suffix(from: partitionIndex))
            """).margin(top: 0, right: 0, bottom: 10, left: 0)
            Small { "Partitioned at index: \(partitionIndex)" }
        }.render().jsValue()
        element(Element.outputTitle.rawValue)?.innerHTML = Code("\(inputArray.description).stablePartition(by: { $0.isMultiple(of: \(multipleOf) })").render().jsValue()
    }
    
    override internal func buildInputArea() -> HTMLElement {
        ResultPane(
            input: VStack {
                HStack(align: .center) {
                    Paragraph("source array:")
                    Input(type: .string, id: Element.arrayInput.rawValue)
                }
                HStack(align: .center) {
                    Paragraph("isMultiple of:")
                    Input(
                        type: .number,
                        id: Element.multipleOfInput.rawValue,
                        value: multipleOf.description,
                        min: "1",
                        max: "\(Int.max)"
                    )
                }
            },
            output: (titleId: Element.outputTitle.rawValue, resultId: Element.output.rawValue)
        )
    }
}
