//
//  VideoViewController.swift
//  PartyRockApp
//
//  Created by Leonardo Correa on 3/22/17.
//  Copyright © 2017 providesolution. All rights reserved.
//

import UIKit

class VideoViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var lblTitle: UILabel!
    
    private var _partyRock: PartyRock!
    
    var partyRock: PartyRock {
        get {
            return _partyRock
        } set {
            _partyRock = newValue
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        lblTitle.text = partyRock.videoTitle;
        webView.loadHTMLString(partyRock.videoURL, baseURL: nil);
        
    }


}
