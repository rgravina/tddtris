@testable import TddTetris

class SpyActionSelector: ActionSelector {
    var next_wasCalled = false
    var next_returnValue = SpyAction()
    func next(state: GameState) -> Action {
        next_wasCalled = true
        return next_returnValue
    }
}