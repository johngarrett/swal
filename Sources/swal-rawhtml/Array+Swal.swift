import Foundation

extension Array where Element == Int {
    init(from string: String) {
        let sanatized = string.trimmingCharacters(in: . whitespacesAndNewlines).dropFirst().dropLast()
        
        self = sanatized.split(separator: ",").compactMap {
            Int($0.trimmingCharacters(in: .whitespaces))
        }
    }
}
extension Array where Element == String {
    init(from string: String) {
        self = string
            .trimmingCharacters(in: . whitespacesAndNewlines)
            .dropFirst() // drop [
            .dropLast() // drop ]
            .split(separator: ",")
            .map {
                String(
                    $0.trimmingCharacters(in: .whitespaces)
                        .dropFirst().dropLast() // drop " and "
                )
            }
    }
}
