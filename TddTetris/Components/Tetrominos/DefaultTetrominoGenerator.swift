class DefaultTetrominoGenerator: TetrominoGenerator {
    func next() -> Tetromino {
        return STetromino(position: (0, 0))
    }
}