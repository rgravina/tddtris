import UIKit

class SpriteKitTetrominoMover {
    private var tetromino: SpriteKitTetromino!
    private let topLeft: CGPoint!

    init(tetromino: SpriteKitTetromino, topLeft: CGPoint) {
        self.tetromino = tetromino
        self.topLeft = topLeft
    }

    func move(
        tetromino: Tetromino
    ) {
        self.tetromino.position = CGPoint(
            x: topLeft.x + (CGFloat(tetromino.position.column) * CGFloat(SpriteKitGameView.BLOCK_SIZE)),
            y: topLeft.y - (CGFloat(tetromino.position.row) * CGFloat(SpriteKitGameView.BLOCK_SIZE))
        )
    }
}
