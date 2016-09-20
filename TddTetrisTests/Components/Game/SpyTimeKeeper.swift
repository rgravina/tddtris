import Foundation
@testable import TddTetris

class SpyTimeKeeper: TimeKeeper {
    var start_wasCalled = false
    func start() {
        start_wasCalled = true
    }

    var update_arg = TimeInterval()
    var update_returnValue = false
    func update(_ now: TimeInterval) -> Bool {
        update_arg = now
        return update_returnValue
    }
}
