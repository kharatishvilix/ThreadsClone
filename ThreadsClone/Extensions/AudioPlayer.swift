import AVFoundation
import AVKit
import Firebase

class SoundManager: ObservableObject {
    static let instance = SoundManager()
    var player: AVAudioPlayer?
    enum soundOption: String {
        case refresh = "refreshFeed"
        case newThread
    }

    func playSound(sound: soundOption) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playAndRecord, options: [.duckOthers, .mixWithOthers])
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Error playing sound \(error.localizedDescription)")
        }
    }
}
