import HyperSwift
import JavaScriptKit

class RotationSection: Section {
    
    enum Element: String {
         case arrayInput = "rotate-array-input",
         rotateToInput = "rotate-to-input",
         output = "rotate-output",
         outputTitle = "rotate-output-title"
    }
    
    var inputArray: [Int] = [1, 2, 3, 4] {
        didSet {
            rotateTo = 0
            updateElements()
        }
    }
    
    lazy var rotatedArray: [Int] = inputArray {
        didSet { updateElements() }
    }
    
    var rotateTo: Int = 0 {
        didSet {
            rotatedArray = inputArray.map { $0 }
            rotatedArray.rotate(toStartAt: rotateTo)
            updateElements()
        }
    }
    
    lazy var updateRotateTo = JSClosure { _ in
        self.rotateTo = Int(element(Element.rotateToInput.rawValue)?.value.string ?? "1") ?? 1
    }
    
    lazy var updateSourceArray = JSClosure { _ in
        self.inputArray = Array(from: element(Element.arrayInput.rawValue)?.value.string ?? "")
    }
    
    public init() {
        super.init(
            title: "Rotations",
            ref: "https://github.com/apple/swift-algorithms/blob/main/Guides/Rotate.md",
            functions: [
                "rotations(toStartAt: )",
                "rotations(subrange: toStartAt: )"
            ],
            subtitle: "A mutating method that rotates the elements of a collection to new positions.",
            additionalText: "To work around the CoW / slice mutation problem for divide-and-conquer algorithms, which are the idiomatic use case for rotation, this also includes variants that take a range"
        )
    }
    
    override internal func updateElements() {
        element(Element.arrayInput.rawValue)?.value = inputArray.description.jsValue()
        element(Element.arrayInput.rawValue)?.onchange = .function(updateSourceArray)
        element(Element.rotateToInput.rawValue)?.onchange = .function(updateRotateTo)
        element(Element.output.rawValue)?.innerHTML = Paragraph(rotatedArray.description).margin(0).render().jsValue()
        element(Element.outputTitle.rawValue)?.innerHTML = Code("\(inputArray.description).rotate(toStartAt: \(rotateTo))").render().jsValue()
        element(Element.rotateToInput.rawValue)?.value = rotateTo.jsValue()
        element(Element.rotateToInput.rawValue)?.max = (inputArray.count - 1).jsValue()
    }
    
    override internal func buildInputArea() -> HTMLElement {
        ResultPane(
            input: VStack {
                HStack(align: .center) {
                    Paragraph("source array:")
                    Input(type: .string, id: Element.arrayInput.rawValue)
                }
                HStack(align: .center) {
                    Paragraph("rotate to:")
                    Input(
                        type: .number,
                        id: Element.rotateToInput.rawValue,
                        value: rotateTo.description,
                        min: "0",
                        max: "\(inputArray.count)"
                    )
                }
            },
            output: (titleId: Element.outputTitle.rawValue, resultId: Element.output.rawValue)
        )
    }
}
