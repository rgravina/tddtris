protocol CollisionDetector {
    func wouldCollide(direction: Direction) -> Bool
    func canRotate() -> Bool
}