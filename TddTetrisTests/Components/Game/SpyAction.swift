@testable import TddTetris

class SpyAction: Action {
    var perform_wasCalled = false
    var perform_returnValue = GameState()
    func perform(state: GameState) -> GameState {
        perform_wasCalled = true
        return perform_returnValue
    }
}