protocol CollisionDetector {
    func wouldCollide(
        state: GameState,
        position: (column: Int, row: Int),
        direction: CollisionDetectorDirection
    ) -> Bool
}