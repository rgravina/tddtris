import SpriteKit

class Block: SKNode {
    static let SIZE = CGFloat(20)
    var sprites = [SKSpriteNode]()

    override init() {
        sprites.append(SKSpriteNode(imageNamed: "blue"))
        sprites.append(SKSpriteNode(imageNamed: "blue"))
        sprites.append(SKSpriteNode(imageNamed: "blue"))
        sprites.append(SKSpriteNode(imageNamed: "blue"))

        sprites[0].position.y = Block.SIZE
        sprites[1].position = CGPoint(
            x: Block.SIZE,
            y: Block.SIZE
        )
        sprites[2].position = CGPointZero
        sprites[3].position.x = Block.SIZE
        super.init()

        for sprite in sprites {
            addChild(sprite)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}