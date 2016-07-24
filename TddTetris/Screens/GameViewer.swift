import SpriteKit

class GameViewer: GameView {
    var view: SKView!
    var scene: GameScene!

    func configure(frame: CGRect) {
        view = SKView(frame: frame)
        view.multipleTouchEnabled = false
        scene = GameScene(
            size: size(),
            blockGenerator: DefaultBlockGenerator()
        )
        scene.scaleMode = .AspectFill
    }

    func presentScene() {
        view.presentScene(scene)
    }

    func size() -> CGSize {
        return view.bounds.size
    }
}