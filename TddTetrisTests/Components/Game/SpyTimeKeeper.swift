import Foundation
@testable import TddTetris

class SpyTimeKeeper: TimeKeeper {
    var start_wasCalled = false
    func start() {
        start_wasCalled = true
    }

    var update_arg = NSTimeInterval()
    var update_returnValue = false
    func update(now: NSTimeInterval) -> Bool {
        update_arg = now
        return update_returnValue
    }
}
