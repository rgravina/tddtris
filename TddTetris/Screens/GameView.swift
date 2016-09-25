import UIKit

protocol GameView {
    var view: UIView! { get }
    func presentScene()
    func configure(_ game: TickHandler, inputHandler: InputHandler, frame: CGRect)
    func size() -> CGSize
    func displayNext(_ tetromino: Tetromino)
    func move(_ tetromino: Tetromino)
    func display(_ tetromino: Tetromino)
}
