import Foundation

extension ClosedRange where Element == Int {
    init(from input: String) {
        let sequence = input
            .trimmingCharacters(in: . whitespacesAndNewlines)
        guard let range = sequence.range(of: "...") else {
            self = 0...0
            return
        }
        
        let (leftText, rightText) = (sequence[..<range.lowerBound], sequence[range.upperBound...])
        
        let lowerBound = Int(leftText) ?? 0
        let upperBound = Int(rightText) ?? 0
        
        self = lowerBound...Swift.max(lowerBound, upperBound)
    }
}
