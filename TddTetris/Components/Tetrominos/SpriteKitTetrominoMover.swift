import UIKit

class SpriteKitTetrominoMover {
    private var tetromino: Tetromino!
    private let topLeft: CGPoint!

    init(tetromino: Tetromino, topLeft: CGPoint) {
        self.tetromino = tetromino
        self.topLeft = topLeft
    }

    func moveToDropCoordinates() {
        self.tetromino.position = CGPoint(
            x: topLeft.x + CGFloat(SpriteKitGameView.BLOCK_SIZE * 3),
            y: topLeft.y
        )
    }

    func moveToPreviewArea() {
        self.tetromino.position = CGPoint(
            x: topLeft.x + CGFloat(SpriteKitGameView.BLOCK_SIZE * 12),
            y: topLeft.y
        )
    }

    func moveDownOneRow() {
        self.tetromino.position = CGPoint(
            x: self.tetromino.position.x,
            y: self.tetromino.position.y - CGFloat(SpriteKitGameView.BLOCK_SIZE)
        )
    }
}