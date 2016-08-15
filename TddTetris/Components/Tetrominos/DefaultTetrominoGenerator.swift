import SpriteKit

class DefaultTetrominoGenerator: TetrominoGenerator {
    func next() -> Tetromino {
        return STetromino()
    }
}