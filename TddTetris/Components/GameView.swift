import SpriteKit

protocol GameView {
    var view: SKView! { get }
    func presentScene(scene: GameScene)
    func configure(frame: CGRect)
    func size() -> CGSize
}
