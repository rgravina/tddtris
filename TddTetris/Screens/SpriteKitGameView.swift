import SpriteKit

class SpriteKitGameView: NSObject, GameView, SKSceneDelegate {
    static let BLOCK_SIZE = 36
    var view: UIView! {
        get {
            return skview as UIView!
        }
    }
    private static let BOARD_TOP_PADDING = 54
    private var skview: SKView!
    private var scene: SKScene!
    private var topLeft: CGPoint!
    private var game: TickHandler!
    private var skTetromino: SpriteKitTetromino!

    func configure(game: TickHandler, frame: CGRect) {
        self.game = game
        skview = SKView(frame: frame)
        view.multipleTouchEnabled = false
        topLeft = CGPoint(
            x: CGFloat(0),
            y: frame.height - CGFloat(SpriteKitGameView.BOARD_TOP_PADDING)
        )
        scene = SKScene(size: size())
        scene.delegate = self
        scene.scaleMode = .AspectFill
    }

    func update(currentTime: NSTimeInterval, forScene scene: SKScene) {
        game.update(currentTime)
    }

    func presentScene() {
        skview.presentScene(scene)
    }

    func size() -> CGSize {
        return skview.bounds.size
    }

    func displayNext(tetromino: Tetromino) {
        skTetromino = SpriteKitSTetromino()
        SpriteKitTetrominoMover(
            tetromino: skTetromino,
            topLeft: topLeft
        ).moveToDropCoordinates()
        scene.addChild(skTetromino as! SKNode)
    }

    func moveDownOneRow() {
        SpriteKitTetrominoMover(
            tetromino: skTetromino,
            topLeft: topLeft
        ).moveDownOneRow()
    }
}