import SpriteKit

class SquareBlock: SKNode, Block {
    private var sprites = [SKSpriteNode]()
    private let block = SKTexture(imageNamed: "blue")

    override init() {
        super.init()
        sprites.append(SKSpriteNode(texture: block, size: CGSize(width: GameScene.BLOCK_SIZE, height: GameScene.BLOCK_SIZE)))
        sprites.append(SKSpriteNode(texture: block, size: CGSize(width: GameScene.BLOCK_SIZE, height: GameScene.BLOCK_SIZE)))
        sprites.append(SKSpriteNode(texture: block, size: CGSize(width: GameScene.BLOCK_SIZE, height: GameScene.BLOCK_SIZE)))
        sprites.append(SKSpriteNode(texture: block, size: CGSize(width: GameScene.BLOCK_SIZE, height: GameScene.BLOCK_SIZE)))

        sprites[0].position.y = CGFloat(GameScene.BLOCK_SIZE)
        sprites[1].position = CGPoint(
            x: GameScene.BLOCK_SIZE,
            y: GameScene.BLOCK_SIZE
        )
        sprites[2].position = CGPointZero
        sprites[3].position.x = CGFloat(GameScene.BLOCK_SIZE)

        for sprite in sprites {
            addChild(sprite)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}