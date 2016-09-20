import SpriteKit

class SpriteKitSTetromino: SKNode, SpriteKitTetromino {
    internal var sprites = [SKSpriteNode]()
    fileprivate let block = SKTexture(imageNamed: "blue")
    override init() {
        super.init()
        sprites.append(SKSpriteNode(texture: block, size: CGSize(width: SpriteKitGameView.BLOCK_SIZE, height: SpriteKitGameView.BLOCK_SIZE)))
        sprites.append(SKSpriteNode(texture: block, size: CGSize(width: SpriteKitGameView.BLOCK_SIZE, height: SpriteKitGameView.BLOCK_SIZE)))
        sprites.append(SKSpriteNode(texture: block, size: CGSize(width: SpriteKitGameView.BLOCK_SIZE, height: SpriteKitGameView.BLOCK_SIZE)))
        sprites.append(SKSpriteNode(texture: block, size: CGSize(width: SpriteKitGameView.BLOCK_SIZE, height: SpriteKitGameView.BLOCK_SIZE)))
        for sprite in sprites {
            addChild(sprite)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
