//
//  AudioSessionViewController.swift
//  Audio
//
//  Created by Mehmet Tarhan on 14/04/2022.
//

import AVFoundation
import UIKit

class AudioSessionViewController: UIViewController {
    @IBOutlet var tableView: UITableView!

    private struct Audio {
        let url: URL
        let title: String
    }

    private let audios: [Audio] = [
        Audio(url: Bundle.main.url(forResource: "50Hz", withExtension: "wav")!, title: "50Hz"),
        Audio(url: Bundle.main.url(forResource: "125Hz", withExtension: "wav")!, title: "125Hz"),
        Audio(url: Bundle.main.url(forResource: "250Hz", withExtension: "wav")!, title: "250Hz"),
        Audio(url: Bundle.main.url(forResource: "500Hz", withExtension: "wav")!, title: "500Hz"),
    ]

    private var audioPlayer: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func pauseAudio(_ sender: UIBarButtonItem) {
        audioPlayer?.pause()
    }

    @IBAction func playAudio(_ sender: UIBarButtonItem) {
        audioPlayer?.play()
    }

    @IBAction func stopAudio(_ sender: UIBarButtonItem) {
        audioPlayer?.stop()
    }

    private func play(_ url: URL) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: nil)
            audioPlayer?.numberOfLoops = 0

        } catch {
            print("AVAudioPlayer error: \(error)")
        }
    }
}

// MARK: - UITableViewDataSource

extension AudioSessionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return audios.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Audio")
        cell?.textLabel?.text = audios[indexPath.row].title
        return cell!
    }
}

// MARK: - UITableViewDelegate

extension AudioSessionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        play(audios[indexPath.row].url)
    }
}
