import Foundation

extension Array where Element == Int {
    init(from string: String) {
        let sanatized = string.trimmingCharacters(in: . whitespacesAndNewlines).dropFirst().dropLast()
        
        self = sanatized.split(separator: ",").compactMap {
            Int($0.trimmingCharacters(in: .whitespaces))
        }
    }
}
