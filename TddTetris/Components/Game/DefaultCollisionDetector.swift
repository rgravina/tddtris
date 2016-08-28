class DefaultCollisionDetector: CollisionDetector {
    func wouldCollide(
        state: GameState,
        position: (column: Int, row: Int)
        ) -> Bool {
        if (position.row == GameState.ROWS - 2) {
            return true
        }
        return false
    }
}