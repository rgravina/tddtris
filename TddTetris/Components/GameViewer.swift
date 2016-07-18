import SpriteKit

class GameViewer: GameView {
    var view: SKView!

    func configure(frame: CGRect) {
        self.view = SKView(frame: frame)
        self.view.multipleTouchEnabled = false
    }

    func presentScene(scene: GameScene) {
        view.presentScene(scene)
    }

    func size() -> CGSize {
        return view.bounds.size
    }
}