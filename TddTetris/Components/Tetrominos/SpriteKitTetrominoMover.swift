import SpriteKit

class SpriteKitTetrominoMover {
    var tetromino: Tetromino!
    let topLeft: CGPoint!

    init(tetromino: Tetromino, topLeft: CGPoint) {
        self.tetromino = tetromino
        self.topLeft = topLeft
    }

    func moveToDropCoordinates() {
        self.tetromino.position = CGPoint(
            x: topLeft.x + CGFloat(SpriteKitGameScene.BLOCK_SIZE * 3),
            y: topLeft.y
        )
    }

    func moveToPreviewArea() {
        self.tetromino.position = CGPoint(
            x: topLeft.x + CGFloat(SpriteKitGameScene.BLOCK_SIZE * 12),
            y: topLeft.y
        )
    }

    func moveDownOneRow() {
        self.tetromino.position = CGPoint(
            x: self.tetromino.position.x,
            y: self.tetromino.position.y - CGFloat(SpriteKitGameScene.BLOCK_SIZE)
        )
    }
}