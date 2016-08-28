class DefaultTetrominoGenerator: TetrominoGenerator {
    func next() -> Tetromino {
        return STetromino(
            position: (3, 0),
            blocks: [
                (column: 3, row: 1),
                (column: 4, row: 0),
                (column: 4, row: 1),
                (column: 5, row: 0),
            ],
            height: 2
        )
    }
}