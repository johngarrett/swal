import Foundation
import JavaScriptKit
extension JSObject {
    func element(_ id: String) -> JSObject? {
        self.getElementById?(id).object
    }
}

