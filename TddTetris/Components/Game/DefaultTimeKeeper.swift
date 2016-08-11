import Foundation

class DefaultTimeKeeper: TimeKeeper {
    let tickLength = CFTimeInterval(0.6)
    var lastTickAt: CFTimeInterval!

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