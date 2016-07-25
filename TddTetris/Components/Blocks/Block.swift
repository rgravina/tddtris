import SpriteKit

class Block: SKNode {
    var sprites = [SKSpriteNode]()

    override init() {
        sprites.append(SKSpriteNode(imageNamed: "blue"))
        sprites.append(SKSpriteNode(imageNamed: "blue"))
        sprites.append(SKSpriteNode(imageNamed: "blue"))
        sprites.append(SKSpriteNode(imageNamed: "blue"))

        sprites[0].position.y = CGFloat(GameScene.BLOCK_SIZE)
        sprites[1].position = CGPoint(
            x: GameScene.BLOCK_SIZE,
            y: GameScene.BLOCK_SIZE
        )
        sprites[2].position = CGPointZero
        sprites[3].position.x = CGFloat(GameScene.BLOCK_SIZE)
        super.init()

        for sprite in sprites {
            addChild(sprite)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}