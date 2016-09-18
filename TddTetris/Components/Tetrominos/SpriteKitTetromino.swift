import SpriteKit

protocol SpriteKitTetromino {
    var position: CGPoint { get set }
    var sprites: [SKSpriteNode] { get }
}