@testable import TddTetris

class SpyAction: Action {
    var perform_wasCalled = false
    func perform(state: GameState) {
        perform_wasCalled = true
    }
}