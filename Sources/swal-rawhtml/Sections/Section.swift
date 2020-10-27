import HyperSwift
import JavaScriptKit

class Section {
    let title: String
    let referenceLink: String
    let codeFunctions: [String]
    let subtitle: String
    let additionalText: String
    internal func buildInputArea() -> HTMLElement { RawHTML("TODO") }
    internal func updateElements() { print("UPDATE ELEMENTS NOT IMPILMENTED") }

    init(title: String, ref: String, functions: [String], subtitle: String, additionalText: String) {
        self.title = title
        referenceLink = ref
        codeFunctions = functions
        self.subtitle = subtitle
        self.additionalText = additionalText

    }
}

extension Section {
    func buildElement() -> HTMLElement {
        Div {
            HStack(justify: .spaceBetween, align: .center) {
                Header(.header2, text: title)
                Link(href: referenceLink) { "ref" }
            }
            Div {
                codeBlocks()
                    .map { $0.render() }
                    .joined(separator: "<br>")
            }
            Paragraph(subtitle)
            Small { additionalText }
            buildInputArea()
        }
    }
    
    private func codeBlocks() -> [Code] {
        codeFunctions.map { Code($0) }
    }
}
