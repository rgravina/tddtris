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
}
