import SpriteKit

protocol GameView {
    var view: SKView! { get }
    var scene: GameScene! { get }
    func presentScene()
    func configure(frame: CGRect)
    func size() -> CGSize
}
