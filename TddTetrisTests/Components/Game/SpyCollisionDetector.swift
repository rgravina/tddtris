@testable import TddTetris

class SpyCollisionDetector: CollisionDetector {
    var wouldCollide_arguments = (column: 0, row: 0)
    var wouldCollide_returnValue = false
    func wouldCollide(state: GameState, position: (column: Int, row: Int)) -> Bool {
        wouldCollide_arguments = position
        return wouldCollide_returnValue
    }
}