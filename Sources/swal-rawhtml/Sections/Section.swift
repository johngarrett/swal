import HyperSwift
import JavaScriptKit

class Section {
    let title: String
    let referenceLink: String
    let codeFunctions: [String]
    let subtitle: String
    let additionalText: String
    internal func buildInputArea() -> HTMLElement {
        ResultPane(
            input: VStack {
                Paragraph("This sandbox has not been implemented yet")
                HStack(justify: .flexStart, align: .center) {
                    Small { "Check the progress here: " }
                    Link(href: "https://www.github.com/johngarrett/swal-wasm") { "github" }
                        .color(CSSColor("#0096cf"))
                }
            },
            output: (titleId: "", resultId: "")
        )
    }
    internal func updateElements() { print("UPDATE ELEMENTS NOT implemented") }

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
            HStack(justify: .flexStart, align: .center) {
                Header(.header2, text: title)
                Link(href: referenceLink) { "⎋" }
                    .color(CSSColor("#0096cf"))
                    .margin(left: 10)
                    .textDecoration(.none)
            }
            VStack(align: .flexStart) {
                codeBlocks()
                    .map { $0
                        .margin(2.5)
                        .color(CSSColor("#ffb454"))
                        .backgroundColor(CSSColor("#191f26"))
                        .rawCSS("font-size", "14px")
                    }
                    .map { $0.render() }
                    .joined()
            }
            Paragraph(subtitle)
                .font(weight: .sixhundred, size: 16, family: "'Open Sans', sans-serif")
            Small { additionalText }
                .font(weight: .fourhundred, size: 14, family: "'Open Sans', sans-serif")
            buildInputArea()
        }
    }
    
    private func codeBlocks() -> [Code] {
        codeFunctions.map { Code($0) }
    }
}
