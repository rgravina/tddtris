class DefaultCollisionDetector: CollisionDetector {
    func wouldCollide(
        state: GameState,
        position: (column: Int, row: Int),
        direction: CollisionDetectorDirection
    ) -> Bool {
        switch (direction) {
        case .DOWN:
            if (position.row == GameState.ROWS - 1) {
                return true
            }
            if (state.cells[position.column][position.row+1]) {
                return true
            }
        default:
            return false
        }
        return false
    }
}