import SpriteKit

class GameScene: SKScene {
    override init(size: CGSize) {
        super.init(size: size)

        anchorPoint = CGPoint(x: 0, y: 1.0)

        let background = SKSpriteNode(imageNamed: "background")
        background.anchorPoint = CGPoint(x: 0, y: 1.0)
        background.name = "background"
        background.position = CGPoint(x: 0, y: 0)
        background.anchorPoint = CGPoint(x: 0, y: 1.0)
        addChild(background)


        let gameBoard = SKSpriteNode(imageNamed: "gameboard")
        gameBoard.name = "gameboard"
        gameBoard.position = CGPoint(x: 6, y: -6)
        gameBoard.anchorPoint = CGPoint(x:0, y:1.0)
        addChild(gameBoard)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoder not supported")
    }
}
