import Foundation

class DefaultTimeKeeper: TimeKeeper {
    private let tickLength = CFTimeInterval(0.6)
    private var lastTickAt: CFTimeInterval!

    func update(now: CFTimeInterval) -> Bool {
        if (lastTickAt == nil) {
            lastTickAt = now
            return false
        }
        if (lastTickAt + tickLength <= now) {
            lastTickAt = now
            return true
        }
        return false
    }
}