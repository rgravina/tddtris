import SpriteKit

class SpriteKitGameView: GameView {
    var view: UIView! {
        get {
            return skview as UIView!
        }
    }
    private var skview: SKView!
    private var scene: SpriteKitGameScene!
    private var topLeft: CGPoint!

    func configure(frame: CGRect) {
        skview = SKView(frame: frame)
        view.multipleTouchEnabled = false
        self.topLeft = CGPoint(
            x: CGFloat(0),
            y: frame.height - CGFloat(SpriteKitGameScene.BOARD_TOP_PADDING)
        )
        scene = SpriteKitGameScene(
            size: size()
        )
        scene.scaleMode = .AspectFill
    }

    func presentScene() {
        skview.presentScene(scene)
    }

    func size() -> CGSize {
        return skview.bounds.size
    }

    func displayNextBlock(block: Block) {
        BlockMover(block: block, topLeft: topLeft).moveToDropCoordinates()
        scene.addChild(block as! SKNode)
    }
}