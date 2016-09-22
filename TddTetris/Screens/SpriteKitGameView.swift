import SpriteKit

class SpriteKitGameView: NSObject, GameView, SKSceneDelegate {
    static let BLOCK_SIZE = 28
    var view: UIView! {
        get {
            return skview as UIView!
        }
    }
    fileprivate static let BOARD_TOP_PADDING = 16
    fileprivate static let BOARD_LEFT_PADDING = 16
    fileprivate var skview: SKView!
    fileprivate var scene: SKScene!
    fileprivate var topLeft: CGPoint!
    fileprivate var game: TickHandler!
    fileprivate var skTetromino: SpriteKitTetromino!
    fileprivate var swipeRightRegognizer: UISwipeGestureRecognizer!
    fileprivate var swipeLeftRegognizer: UISwipeGestureRecognizer!
    fileprivate var swipeDownRegognizer: UISwipeGestureRecognizer!
    fileprivate var tapRecogniser: UITapGestureRecognizer!
    fileprivate var inputHandler: InputHandler!
    func configure(
        _ game: TickHandler,
        inputHandler: InputHandler,
        frame: CGRect
    ) {
        self.game = game
        self.inputHandler = inputHandler
        skview = SKView(frame: frame)
        view.isMultipleTouchEnabled = false
        topLeft = CGPoint(
            x: CGFloat(CGFloat(SpriteKitGameView.BOARD_LEFT_PADDING)),
            y: frame.height - CGFloat(SpriteKitGameView.BOARD_TOP_PADDING)
        )
        scene = SKScene(size: size())
        scene.delegate = self
        scene.scaleMode = .aspectFill

        swipeRightRegognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.didSwipe(_:)))
        swipeRightRegognizer.direction = UISwipeGestureRecognizerDirection.right
        skview.addGestureRecognizer(swipeRightRegognizer)

        swipeLeftRegognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.didSwipe(_:)))
        swipeLeftRegognizer.direction = UISwipeGestureRecognizerDirection.left
        skview.addGestureRecognizer(swipeLeftRegognizer)

        swipeDownRegognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.didSwipe(_:)))
        swipeDownRegognizer.direction = UISwipeGestureRecognizerDirection.down
        skview.addGestureRecognizer(swipeDownRegognizer)

        tapRecogniser = UITapGestureRecognizer(target: self, action: #selector(self.didTap(_:)))
        skview.addGestureRecognizer(tapRecogniser)
    }

    func didSwipe(_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case UISwipeGestureRecognizerDirection.left:
            inputHandler.didSwipeLeft()
        case UISwipeGestureRecognizerDirection.right:
            inputHandler.didSwipeRight()
        case UISwipeGestureRecognizerDirection.down:
            inputHandler.didSwipeDown()
        default: break
        }
    }

    func didTap(_ sender: UITapGestureRecognizer) {
        inputHandler.didTap()
    }

    func update(_ currentTime: TimeInterval, for scene: SKScene) {
        game.update(currentTime)
    }

    func presentScene() {
        skview.presentScene(scene)
    }

    func size() -> CGSize {
        return skview.bounds.size
    }

    func displayNext(_ tetromino: Tetromino) {
        skTetromino = DefaultSpriteKitTetromino()
        scene.addChild(skTetromino as! SKNode)
        move(tetromino)
        SpriteKitTetrominoMover(
            tetromino: skTetromino,
            topLeft: topLeft
        ).display(tetromino)
    }

    func move(_ tetromino: Tetromino) {
        SpriteKitTetrominoMover(
            tetromino: skTetromino,
            topLeft: topLeft
        ).move(tetromino)
    }
}
