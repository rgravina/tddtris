class GameState {
    static let ROWS = 20
    static let COLUMNS = 10
    var tetromino: Tetromino?
    var cells: Array<Array<Bool>>

    init() {
        cells = Array<Array<Bool>>(
            repeating: Array<Bool>(
                repeating: false,
                count: GameState.ROWS
            ),
            count: GameState.COLUMNS
        )
    }

    func allocate(column: Int, row: Int) {
        guard inBounds(column: column, row: row) else {
            return
        }
        cells[column][row] = true
    }

    func free(column: Int, row: Int) {
        guard inBounds(column: column, row: row) else {
            return
        }
        cells[column][row] = false
    }

    func cell(column: Int, row: Int) -> Bool {
        guard inBounds(column: column, row: row) else {
            return false
        }
        return cells[column][row]
    }

    private func inBounds(column: Int, row: Int) -> Bool {
        if (column >= 0 && column >= GameState.COLUMNS) {
            return false
        }
        if (row >= 0 && row >= GameState.ROWS) {
            return false
        }
        return true
    }
}
