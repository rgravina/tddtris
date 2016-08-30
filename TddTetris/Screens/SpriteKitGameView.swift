import SpriteKit

class SpriteKitGameView: NSObject, GameView, SKSceneDelegate {
    static let BLOCK_SIZE = 24
    var view: UIView! {
        get {
            return skview as UIView!
        }
    }
    private static let BOARD_TOP_PADDING = 38
    private static let BOARD_LEFT_PADDING = 12
    private var skview: SKView!
    private var scene: SKScene!
    private var topLeft: CGPoint!
    private var game: TickHandler!
    private var skTetromino: SpriteKitTetromino!
    private var swipeRightRegognizer: UISwipeGestureRecognizer!
    private var swipeLeftRegognizer: UISwipeGestureRecognizer!
    private var inputHandler: InputHandler!

    func configure(
        game: TickHandler,
        inputHandler: InputHandler,
        frame: CGRect
    ) {
        self.game = game
        self.inputHandler = inputHandler
        skview = SKView(frame: frame)
        view.multipleTouchEnabled = false
        topLeft = CGPoint(
            x: CGFloat(CGFloat(SpriteKitGameView.BOARD_LEFT_PADDING)),
            y: frame.height - CGFloat(SpriteKitGameView.BOARD_TOP_PADDING)
        )
        scene = SKScene(size: size())
        scene.delegate = self
        scene.scaleMode = .AspectFill

        swipeRightRegognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.didSwipe(_:)))
        swipeRightRegognizer.direction = UISwipeGestureRecognizerDirection.Right
        skview.addGestureRecognizer(swipeRightRegognizer)

        let swipeLeftRegognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.didSwipe(_:)))
        swipeLeftRegognizer.direction = UISwipeGestureRecognizerDirection.Left
        skview.addGestureRecognizer(swipeLeftRegognizer)
    }

    func didSwipe(sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case UISwipeGestureRecognizerDirection.Left:
            inputHandler.didSwipeLeft()
        case UISwipeGestureRecognizerDirection.Right:
            inputHandler.didSwipeRight()
        default: break
        }
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

    func moveLeftOneColumn() {
        SpriteKitTetrominoMover(
            tetromino: skTetromino,
            topLeft: topLeft
            ).moveLeftOneColumn()
    }
}