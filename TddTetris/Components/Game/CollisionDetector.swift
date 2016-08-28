protocol CollisionDetector {
    func wouldCollide(
        state: GameState,
        position: (column: Int, row: Int)
    ) -> Bool
}