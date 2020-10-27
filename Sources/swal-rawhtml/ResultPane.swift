import HyperSwift

class ResultPane: HTMLComponent {
    init(input: HTMLComponent, output: (titleId: String, resultId: String)) {
        super.init(
            HStack(wrap: .wrap) {
                input
                    .rawCSS("flex-grow", "1")
                    .color(CSSColor("#000000"))
                    .backgroundColor(CSSColor("#B7B7B7"))
                    .padding(10)
                VStack(align: .center) {
                    RawHTML("<h3 id=\"\(output.titleId)\"></h3>")
                    Paragraph(id: output.resultId, text: "")
                        .width(100, .percent)
                }
                    .rawCSS("flex-grow", "1")
                    .maxHeight(400)
                    .overflow(.scroll)
                    .color(CSSColor("#000000"))
                    .backgroundColor(CSSColor("#D1E8E2"))
                    .padding(10)
                    .textAlign(.right)
            }
            .font(weight: .twohundred, size: 14, family: "'Trispace', sans-serif")
            .overflow(.hidden)
            .borderRadius(16)
            .margin(top: 10, bottom: 10)
        )
    }
}
