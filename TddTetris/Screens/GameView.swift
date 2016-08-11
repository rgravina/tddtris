import SpriteKit

protocol GameView {
    var view: UIView! { get }
    func presentScene()
    func configure(game: Game, frame: CGRect, timeKeeper: TimeKeeper)
    func size() -> CGSize
    func displayNextBlock(block: Block)
    func moveBlockDownOneRow(block: Block)
}
