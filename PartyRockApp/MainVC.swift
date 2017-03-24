//
//  ViewController.swift
//  PartyRockApp
//
//  Created by Leonardo Correa on 3/20/17.
//  Copyright © 2017 providesolution. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var partyRocks = [PartyRock]();
    
    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let p1 = PartyRock(
            imageURL: "https://i.ytimg.com/vi/TOJxssd441I/hqdefault.jpg?custom=true&w=168&h=94&stc=true&jpg444=true&jpgq=90&sp=68&sigh=aruT42LAnPAqk5MByua9kxM7Pfc",
            videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/uuXigStwJUM\" frameborder=\"0\" allowfullscreen></iframe>",
            videoTitle: "HIGHLIGHTS: Canada v Korea - CPT World Women's Curling Championship 2017")
        
        let p2 = PartyRock(
            imageURL: "https://i.ytimg.com/vi/tNNDMjST0e4/hqdefault.jpg?custom=true&w=168&h=94&stc=true&jpg444=true&jpgq=90&sp=68&sigh=2WiV0w08OtS01c8VXqN5NallIJo",
            videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/jEI1Rf40r1k\" frameborder=\"0\" allowfullscreen></iframe>",
            videoTitle: "Grab a Cab with... Josephine Obermann (Team Germany)")
        
        let p3 = PartyRock(
            imageURL: "https://i.ytimg.com/vi/gFISdbJ9piM/hqdefault.jpg?custom=true&w=168&h=94&stc=true&jpg444=true&jpgq=90&sp=68&sigh=xrdfz6BBVh67weWXAfxuNT75tCM",
            videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/gFISdbJ9piM\" frameborder=\"0\" allowfullscreen></iframe>",
            videoTitle: "Grab a Cab with... Eve Muirhead (Team Scotland)")
        
        let p4 = PartyRock(
            imageURL: "https://i.ytimg.com/vi/-Nn3GtTMp04/hqdefault.jpg?custom=true&w=168&h=94&stc=true&jpg444=true&jpgq=90&sp=68&sigh=dpBV4zomWUqxombe_ty3p-NugcE",
            videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/-Nn3GtTMp04\" frameborder=\"0\" allowfullscreen></iframe>",
            videoTitle: "Team Homan: Friendship \"is what sets us apart\" | CBC Sports")
        
        partyRocks.append(p1);
        partyRocks.append(p2);
        partyRocks.append(p3);
        partyRocks.append(p4);
        
        
        
        tableView.delegate = self;
        tableView.dataSource = self;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
            
            let partyRock = partyRocks[indexPath.row];
            cell.updateUI(partyRock: partyRock)
            return cell;
        } else {
            
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row];
        performSegue(withIdentifier: "VideoVC", sender: partyRock);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoViewController {
            if let party = sender as? PartyRock {
                destination.partyRock = party;
            }
        }
    }
    
}

