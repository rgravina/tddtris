import SpriteKit

class Block: SKNode {
    let SPRITE_DISTANCE = CGFloat(20)
    var sprites = [SKSpriteNode]()

    override init() {
        sprites.append(SKSpriteNode(imageNamed: "blue"))
        sprites.append(SKSpriteNode(imageNamed: "blue"))
        sprites.append(SKSpriteNode(imageNamed: "blue"))
        sprites.append(SKSpriteNode(imageNamed: "blue"))

        sprites[1].position.x = SPRITE_DISTANCE
        sprites[2].position.y = SPRITE_DISTANCE
        sprites[3].position = CGPoint(
            x: SPRITE_DISTANCE,
            y: SPRITE_DISTANCE
        )
        super.init()

        for sprite in sprites {
            addChild(sprite)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}