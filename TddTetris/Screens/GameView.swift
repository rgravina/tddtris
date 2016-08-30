import UIKit

protocol GameView {
    var view: UIView! { get }
    func presentScene()
    func configure(game: TickHandler, inputHandler: InputHandler, frame: CGRect)
    func size() -> CGSize
    func displayNext(tetromino: Tetromino)
    func moveDownOneRow()
    func moveLeftOneColumn()
}
