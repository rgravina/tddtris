@testable import TddTetris

class SpyCollisionDetector: CollisionDetector {
    var wouldCollide_arguments: Direction!
    var wouldCollide_returnValue = false
    func wouldCollide(_ direction: Direction) -> Bool {
        wouldCollide_arguments = direction
        return wouldCollide_returnValue
    }

    var canRotate_wasCalled = false
    var canRotate_returnValue = false
    func canRotate() -> Bool {
        canRotate_wasCalled = true
        return canRotate_returnValue
    }
}
