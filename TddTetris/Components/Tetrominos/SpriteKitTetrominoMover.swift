import UIKit

class SpriteKitTetrominoMover {
    fileprivate var tetromino: SpriteKitTetromino!
    fileprivate let topLeft: CGPoint!

    init(tetromino: SpriteKitTetromino, topLeft: CGPoint) {
        self.tetromino = tetromino
        self.topLeft = topLeft
    }

    func move(_ tetromino: Tetromino) {
        self.tetromino.position = CGPoint(
            x: topLeft.x + (CGFloat(tetromino.position.column * SpriteKitGameView.BLOCK_SIZE)),
            y: topLeft.y - (CGFloat(tetromino.position.row * SpriteKitGameView.BLOCK_SIZE))
        )
    }

    func display(_ tetromino: Tetromino) {
        for (index, position) in tetromino.blocks.enumerated() {
            self.tetromino.sprites[index].position = CGPoint(
                x: CGFloat((position.column - tetromino.position.column) * SpriteKitGameView.BLOCK_SIZE),
                y: CGFloat(-((position.row - tetromino.position.row) * SpriteKitGameView.BLOCK_SIZE))
            )
        }
    }
}
