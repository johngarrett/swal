import HyperSwift

class ResultPane: HTMLComponent {
    init(input: HTMLComponent, output: (titleId: String, resultId: String)) {
        super.init(
            HStack(wrap: .wrap) {
                input
                    .rawCSS("flex-grow", "1")
                    .color(CSSColor("#000000"))
                    .rawCSS("background-color", "hsl(210, 25%, 28%)")
                    .padding(top: 10, right: 10, bottom: 10, left: 20)
                VStack(align: .center) {
                    RawHTML("<h3 id=\"\(output.titleId)\"></h3>")
                    Paragraph(id: output.resultId, text: "")
                        .width(100, .percent)
                        .margin(top: 0)
                        .margin(bottom: 10)
                        .color(CSSColor("#b7b9cc"))
                }.rawCSS("flex-grow", "1")
                .maxHeight(400)
                .overflow(.scroll)
                .rawCSS("background-color", "hsl(226, 15%, 17%)")
                .padding(top: 10, right: 20, bottom: 10, left: 10)
                .textAlign(.right)
            }
            .font(weight: .twohundred, size: 14, family: "'Trispace', monospaced")
            .overflow(.hidden)
            .margin(top: 20, bottom: 10)
        )
    }
}
