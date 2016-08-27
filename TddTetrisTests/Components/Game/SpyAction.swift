@testable import TddTetris

class SpyAction: Action {
    var perform_wasCalled = false
    func perform() {
        perform_wasCalled = true
    }
}