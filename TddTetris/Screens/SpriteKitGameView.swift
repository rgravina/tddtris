import SpriteKit

class SpriteKitGameView: NSObject, GameView, SKSceneDelegate {
    static let BLOCK_SIZE = 28
    var view: UIView! {
        get {
            return skview as UIView!
        }
    }
    private static let BOARD_TOP_PADDING = 46
    private static let BOARD_LEFT_PADDING = 16
    private var skview: SKView!
    private var scene: SKScene!
    private var topLeft: CGPoint!
    private var game: TickHandler!
    private var skTetromino: SpriteKitTetromino!
    private var swipeRightRegognizer: UISwipeGestureRecognizer!
    private var swipeLeftRegognizer: UISwipeGestureRecognizer!
    private var swipeDownRegognizer: UISwipeGestureRecognizer!
    private var tapRecogniser: UITapGestureRecognizer!
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

        swipeLeftRegognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.didSwipe(_:)))
        swipeLeftRegognizer.direction = UISwipeGestureRecognizerDirection.Left
        skview.addGestureRecognizer(swipeLeftRegognizer)

        swipeDownRegognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.didSwipe(_:)))
        swipeDownRegognizer.direction = UISwipeGestureRecognizerDirection.Down
        skview.addGestureRecognizer(swipeDownRegognizer)

        tapRecogniser = UITapGestureRecognizer(target: self, action: #selector(self.didTap(_:)))
        skview.addGestureRecognizer(tapRecogniser)
    }

    func didSwipe(sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case UISwipeGestureRecognizerDirection.Left:
            inputHandler.didSwipeLeft()
        case UISwipeGestureRecognizerDirection.Right:
            inputHandler.didSwipeRight()
        case UISwipeGestureRecognizerDirection.Down:
            inputHandler.didSwipeDown()
        default: break
        }
    }

    func didTap(sender: UITapGestureRecognizer) {
        inputHandler.didTap()
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
        move(tetromino)
        scene.addChild(skTetromino as! SKNode)
    }

    func move(tetromino: Tetromino) {
        SpriteKitTetrominoMover(
            tetromino: skTetromino,
            topLeft: topLeft
        ).move(tetromino)
    }
}
