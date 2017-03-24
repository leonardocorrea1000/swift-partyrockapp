//
//  PartyCell.swift
//  PartyRockApp
//
//  Created by Leonardo Correa on 3/22/17.
//  Copyright © 2017 providesolution. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {
    
    @IBOutlet weak var videoPreviewImage: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func updateUI(partyRock: PartyRock) {
        
        videoTitle.text = partyRock.videoTitle;

        let url = URL(string: partyRock.imageUrl)!;
        
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.global().sync {
                    self.videoPreviewImage.image = UIImage(data: data)
                }
            } catch {
                // handle the error
            }
        }
    }

}
