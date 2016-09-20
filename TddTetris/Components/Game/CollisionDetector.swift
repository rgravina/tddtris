protocol CollisionDetector {
    func wouldCollide(_ direction: Direction) -> Bool
    func canRotate() -> Bool
}
