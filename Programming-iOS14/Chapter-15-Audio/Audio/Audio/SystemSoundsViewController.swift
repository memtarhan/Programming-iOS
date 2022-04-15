//
//  ViewController.swift
//  Audio
//
//  Created by Mehmet Tarhan on 14/04/2022.
//

import AudioToolbox
import UIKit

class SystemSoundsViewController: UIViewController {
    private var playing = false

    private var image: UIImage? {
        playing ? UIImage(systemName: "stop.fill") : UIImage(systemName: "play.fill")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapPlay(_ sender: UIButton) {
        playing.toggle()
        sender.setImage(image, for: .normal)
        play()
    }

    private func play() {
        guard let sndurl = Bundle.main.url(forResource: "500Hz", withExtension: "wav") else { return }
        var snd: SystemSoundID = 0
        AudioServicesCreateSystemSoundID(sndurl as CFURL, &snd)
        AudioServicesPlaySystemSoundWithCompletion(snd) {
            AudioServicesDisposeSystemSoundID(snd)
        }
//        AudioServicesAddSystemSoundCompletion(snd, nil, nil, { snd, _ in
//            AudioServicesRemoveSystemSoundCompletion(snd)
//            AudioServicesDisposeSystemSoundID(snd)
//        }, nil)
//        AudioServicesPlaySystemSound(snd)
    }
}
