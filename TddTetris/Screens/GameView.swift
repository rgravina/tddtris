import SpriteKit

protocol GameView {
    var view: UIView! { get }
    func presentScene()
    func configure(frame: CGRect)
    func size() -> CGSize
    func displayNextBlock(block: Block)
}
