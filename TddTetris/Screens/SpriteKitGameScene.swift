import SpriteKit

class SpriteKitGameScene: SKScene {
    static let BLOCK_SIZE = 36
    static let BOARD_TOP_PADDING = 54
    let timeKeeper: TimeKeeper!
    let game: Game!

    init(game: Game, size: CGSize, timeKeeper: TimeKeeper) {
        self.game = game
        self.timeKeeper = timeKeeper
        super.init(size: size)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoder not supported")
    }

    override func update(currentTime: CFTimeInterval) {
        if (timeKeeper.update(currentTime)) {
            game.tick()
        }
    }
}
