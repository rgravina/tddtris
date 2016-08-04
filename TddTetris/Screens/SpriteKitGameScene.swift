import SpriteKit

class SpriteKitGameScene: SKScene {
    static let BLOCK_SIZE = 36
    static let BOARD_TOP_PADDING = 54

    override init(size: CGSize) {
        super.init(size: size)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoder not supported")
    }
}
