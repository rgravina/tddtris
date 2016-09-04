@testable import TddTetris

class SpyCollisionDetector: CollisionDetector {
    var wouldCollide_arguments: CollisionDetectorDirection!
    var wouldCollide_returnValue = false
    func wouldCollide(direction: CollisionDetectorDirection) -> Bool {
        wouldCollide_arguments = direction
        return wouldCollide_returnValue
    }
}