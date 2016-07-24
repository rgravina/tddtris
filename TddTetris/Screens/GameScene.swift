import SpriteKit

class GameScene: SKScene {
    var blockGenerator: BlockGenerator!

    convenience init(size: CGSize, blockGenerator: BlockGenerator) {
        self.init(size: size)
        self.blockGenerator = blockGenerator

        setupBackgroundImages()
        displayNextBlock()
    }

    override init(size: CGSize) {
        super.init(size: size)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoder not supported")
    }

    private func setupBackgroundImages() {
        let background = SKSpriteNode(imageNamed: "background")
        background.name = "background"
        background.anchorPoint = CGPoint(x: 0, y: 0)
        addChild(background)

        let gameBoard = SKSpriteNode(imageNamed: "gameboard")
        gameBoard.name = "gameboard"
        gameBoard.anchorPoint = CGPoint(x: 0, y: 1)
        gameBoard.position = CGPoint(x: 6, y: frame.height - 6)
        addChild(gameBoard)
    }

    private func displayNextBlock() {
        let block = blockGenerator.nextBlock()
        block.position = CGPoint(x: 90, y: frame.height - 40)
        addChild(block)
    }
}
