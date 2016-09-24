class GameState {
    static let ROWS = 20
    static let COLUMNS = 10
    var cells: Array<Array<Bool>>
    var tetromino: Tetromino?

    init() {
        cells = Array<Array<Bool>>(
            repeating: Array<Bool>(
                repeating: false,
                count: GameState.ROWS
            ),
            count: GameState.COLUMNS
        )
    }

    func occupy(position: Position) {
        guard inBounds(position: position) else {
            return
        }
        cells[position.column][position.row] = true
    }

    func free(position: Position) {
        guard inBounds(position: position) else {
            return
        }
        cells[position.column][position.row] = false
    }

    func occupied(position: Position) -> Bool {
        guard inBounds(position: position) else {
            return false
        }
        return cells[position.column][position.row]
    }

    private func inBounds(position: Position) -> Bool {
        if (position.column >= 0 && position.column >= GameState.COLUMNS) {
            return false
        }
        if (position.row >= 0 && position.row >= GameState.ROWS) {
            return false
        }
        return true
    }
}
