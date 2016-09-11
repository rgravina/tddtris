@testable import TddTetris

class SpyCollisionDetector: CollisionDetector {
    var wouldCollide_arguments: Direction!
    var wouldCollide_returnValue = false
    func wouldCollide(direction: Direction) -> Bool {
        wouldCollide_arguments = direction
        return wouldCollide_returnValue
    }
}