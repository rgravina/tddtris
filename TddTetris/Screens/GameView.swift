import UIKit

protocol GameView {
    var view: UIView! { get }
    func presentScene()
    func configure(game: TickHandler, frame: CGRect)
    func size() -> CGSize
    func displayNext(tetromino: Tetromino)
    func moveDownOneRow(tetromino: Tetromino)
}
