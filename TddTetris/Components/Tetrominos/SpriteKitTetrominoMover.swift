import UIKit

class SpriteKitTetrominoMover {
    private var tetromino: SpriteKitTetromino!
    private let topLeft: CGPoint!

    init(tetromino: SpriteKitTetromino, topLeft: CGPoint) {
        self.tetromino = tetromino
        self.topLeft = topLeft
    }

    func moveToDropCoordinates() {
        tetromino.position = CGPoint(
            x: topLeft.x + CGFloat(SpriteKitGameView.BLOCK_SIZE * 3),
            y: topLeft.y
        )
    }

    func moveToPreviewArea() {
        tetromino.position = CGPoint(
            x: topLeft.x + CGFloat(SpriteKitGameView.BLOCK_SIZE * 12),
            y: topLeft.y
        )
    }

    func moveDownOneRow() {
        tetromino.position = CGPoint(
            x: self.tetromino.position.x,
            y: self.tetromino.position.y - CGFloat(SpriteKitGameView.BLOCK_SIZE)
        )
    }

    func moveLeftOneColumn() {
        tetromino.position = CGPoint(
            x: self.tetromino.position.x - CGFloat(SpriteKitGameView.BLOCK_SIZE),
            y: self.tetromino.position.y
        )
    }
}