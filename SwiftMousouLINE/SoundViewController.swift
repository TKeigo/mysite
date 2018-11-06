//
//  SoundViewController.swift
//  SwiftMousouLINE
//
//  Created by 神崎泰旗 on 2018/10/13.
//  Copyright © 2018年 taiki. All rights reserved.
//

import UIKit
import AVFoundation

class SoundViewController: UIViewController {

    @IBOutlet var timeLabel: UILabel!
    
    @IBOutlet var imageView2: UIImageView!
    
    var audioPlayer : AVAudioPlayer!
    
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //画面が初めに表示された時非表示にしておく
        imageView2.isHidden = true
        
        //ラベルを非表示
        
        timeLabel.isHidden = true
        
        //音声(callMusic.mp3)を再生する
        if let url = Bundle.main.url(forResource: "callMusic", withExtension: "mp3"){
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                audioPlayer = nil
            }
        } else {
            fatalError("url is nill")
        }
        

    }
    
    @IBAction func tap(_ sender: Any) {
        
        //imageView2の非表示を表示に変える
        imageView2.isHidden = false
        
        //timeLabelの非表示を表示に変える
        timeLabel.isHidden = false

        //タイマーをスタートさせてラベル(timeLabel)へ秒数を表示する
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timercountUp), userInfo: nil, repeats: true)
        
        
        
        //baby.mp3の音声を再生する
        playBabySound()
    }
    
    
    func playBabySound(){
        //音声(callMusic.mp3)を再生する
        if let url = Bundle.main.url(forResource: "baby", withExtension: "mp3"){
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                audioPlayer = nil
            }
        } else {
            fatalError("url is nill")
        }
    }
    
    @objc func timercountUp(){
        
        count += 1
        timeLabel.text = String(count)

    }
    
    @IBAction func deny(_ sender: Any) {
        //電話を切る
        
        //音声(callMusic.mp3)をストップさせる
        audioPlayer.stop()
        //画面をViewControllerへ戻す(遷移させる)
        dismiss(animated: true, completion: nil)
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    

}
