//
//  AppDelegate.swift
//  Audio
//
//  Created by Mehmet Tarhan on 14/04/2022.
//

import AVFoundation
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        /*

         setCategory(_:mode:options:)

          // Category
          Your app, if it is going to be producing sound, needs to specify a policy regarding that sound and tell the media services daemon about it. This policy will answer such questions as:

          * Should your app’s sound be stopped when the screen is locked?
          * If other sound is being produced (as when the Music app is playing a song in the background), should your app stop that sound or be layered on top of it?

         The basic policies for audio playback are:

         * Ambient (.ambient)
            Your app’s audio plays even while another app is playing audio, and is stopped by the phone’s Silent switch and screen locking.

         * Solo Ambient (.soloAmbient, the default)
            Your app stops any audio being played by other apps, and is stopped by the phone’s Silent switch and screen locking.

         * Playback (.playback)
            Your app stops any audio being played by other apps, and is not stopped by the Silent switch. It is stopped by screen locking, unless it is also configured to play in the background.

         Audio session category options (the options: parameter, AVAudioSession.CategoryOptions) allow you to modify the playback policies:

         * Mixable audio (.mixWithOthers)
            You can override the Playback policy so as to allow other apps to continue playing audio. Your sound is then said to be mixable. Mixability can also affect you in the other direction: another app’s mixable audio can continue to play even when your app’s Playback policy is not mixable.

         * Mixable except for speech (.interruptSpokenAudioAndMixWithOthers)
            Similar to .mixWithOthers, but although you are willing to mix with background music, you are electing to stop background speech. An app’s audio is marked as speech by setting its audio session mode to .spokenAudio.

         * Ducking audio (.duckOthers)
            You can override a policy that allows other audio to play, so as to duck (diminish the volume of) that other audio. Ducking is a form of mixing.

         // Activation and Deactivation
         Your audio session policy is not in effect unless your audio session is also active. By default, it isn’t. Asserting your audio session policy is done by a combination of configuring the audio session and activating the audio session. To activate your audio session, you call setActive(true).

         The question is when to call setActive(true). This depends on whether you need your audio session to be active all the time or only when you are producing sound. In many cases, it will be best not to activate your audio session until just before you start to produce sound. But let’s take a very simple case where our sounds are always occasional, intermittent, and nonessential. We want sound from other apps, such as the Music app, to be allowed to continue playing when the user launches or switches to our app. That’s the Ambient policy. Our policy will never vary, and it doesn’t stop other audio, so we might as well set our app’s category and activate it at launch time

         */

        let audioSession = AVAudioSession.sharedInstance()
        try? audioSession.setCategory(.ambient, mode: .default)
        try? audioSession.setActive(true)

        /*

          It is also possible to call setActive(false), deactivating your audio session. There are various reasons why you might deactivate (and perhaps reactivate) your audio session over the lifetime of your app.

          One possible reason is that you want to change something about your audio session policy. Certain changes in your audio session category and options don’t take effect unless you deactivate the existing policy and activate the new policy. Ducking is a good example; I’ll demonstrate in the next section.

          Another reason for deactivating your audio session is that you have stopped playing sound; you no longer need to hog the device’s audio, and you want to yield to other apps that were stopped by your audio session policy, so that they can resume playing. You can even send a message to other apps as you do this, by supplying the .notifyOthersOnDeactivation option in a call to setActive(_:options:), like this:

          let sess = AVAudioSession.sharedInstance()
          try? sess.setActive(false, options: .notifyOthersOnDeactivation)

         */

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}
