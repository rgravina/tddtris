import UIKit

protocol Game {
    var viewer: GameView! { get }
    func configure(frame: CGRect)
    func tick()
}