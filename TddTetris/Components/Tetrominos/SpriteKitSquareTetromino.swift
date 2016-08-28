import SpriteKit

class SpriteKitSquareTetromino: SKNode, SpriteKitTetromino {
    private var sprites = [SKSpriteNode]()
    private let block = SKTexture(imageNamed: "blue")

    override init() {
        super.init()
        sprites.append(SKSpriteNode(texture: block, size: CGSize(width: SpriteKitGameView.BLOCK_SIZE, height: SpriteKitGameView.BLOCK_SIZE)))
        sprites.append(SKSpriteNode(texture: block, size: CGSize(width: SpriteKitGameView.BLOCK_SIZE, height: SpriteKitGameView.BLOCK_SIZE)))
        sprites.append(SKSpriteNode(texture: block, size: CGSize(width: SpriteKitGameView.BLOCK_SIZE, height: SpriteKitGameView.BLOCK_SIZE)))
        sprites.append(SKSpriteNode(texture: block, size: CGSize(width: SpriteKitGameView.BLOCK_SIZE, height: SpriteKitGameView.BLOCK_SIZE)))

        sprites[0].position.y = CGFloat(SpriteKitGameView.BLOCK_SIZE)
        sprites[1].position = CGPoint(
            x: SpriteKitGameView.BLOCK_SIZE,
            y: SpriteKitGameView.BLOCK_SIZE
        )
        sprites[2].position = CGPointZero
        sprites[3].position.x = CGFloat(SpriteKitGameView.BLOCK_SIZE)

        for sprite in sprites {
            addChild(sprite)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}