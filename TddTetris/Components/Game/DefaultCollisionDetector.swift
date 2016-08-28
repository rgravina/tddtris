class DefaultCollisionDetector: CollisionDetector {
    func wouldCollide(
        state: GameState,
        position: (column: Int, row: Int)
    ) -> Bool {
        if (position.row == GameState.ROWS - 1) {
            return true
        }
        if (state.cells[position.column][position.row+1]) {
            return true
        }
        return false
    }
}