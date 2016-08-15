import SpriteKit

class STetromino: SKNode, Tetromino {
    private var sprites = [SKSpriteNode]()
    private let block = SKTexture(imageNamed: "blue")
    var blockWidth:Int { get { return 4 } }
    override init() {
        super.init()
        sprites.append(SKSpriteNode(texture: block, size: CGSize(width: SpriteKitGameScene.BLOCK_SIZE, height: SpriteKitGameScene.BLOCK_SIZE)))
        sprites.append(SKSpriteNode(texture: block, size: CGSize(width: SpriteKitGameScene.BLOCK_SIZE, height: SpriteKitGameScene.BLOCK_SIZE)))
        sprites.append(SKSpriteNode(texture: block, size: CGSize(width: SpriteKitGameScene.BLOCK_SIZE, height: SpriteKitGameScene.BLOCK_SIZE)))
        sprites.append(SKSpriteNode(texture: block, size: CGSize(width: SpriteKitGameScene.BLOCK_SIZE, height: SpriteKitGameScene.BLOCK_SIZE)))

        sprites[0].position = CGPoint(
            x: SpriteKitGameScene.BLOCK_SIZE,
            y: SpriteKitGameScene.BLOCK_SIZE
        )
        sprites[1].position = CGPoint(
            x: SpriteKitGameScene.BLOCK_SIZE*2,
            y: SpriteKitGameScene.BLOCK_SIZE
        )
        sprites[2].position = CGPointZero
        sprites[3].position.x = CGFloat(SpriteKitGameScene.BLOCK_SIZE)

        for sprite in sprites {
            addChild(sprite)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}