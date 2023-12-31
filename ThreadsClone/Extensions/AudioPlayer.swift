import AVFoundation
import AVKit
import Firebase

class SoundManager: ObservableObject {
    static let instance = SoundManager()
    var player: AVAudioPlayer?
    enum soundOption: String {
        case refresh = "refreshFeed"
        case newthread = "newThread"
        case deletethread = "deleteThread"
    }

    func playSound(sound: soundOption) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mpp3") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playAndRecord, options: [])
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Error playing sound \(error.localizedDescription)")
        }
    }
}
