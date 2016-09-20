import Foundation

class DefaultTimeKeeper: TimeKeeper {
    fileprivate let tickLength = CFTimeInterval(0.6)
    fileprivate var lastTickAt: CFTimeInterval!

    func update(_ now: CFTimeInterval) -> Bool {
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
