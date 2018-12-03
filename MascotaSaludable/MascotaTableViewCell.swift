//
//  MascotaTableViewCell.swift
//  MascotaSaludable
//
//  Created by iPhone on 12/2/18.
//  Copyright © 2018 iPhone. All rights reserved.
//

import UIKit

class MascotaTableViewCell: UITableViewCell {

    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
