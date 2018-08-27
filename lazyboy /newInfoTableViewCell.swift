//
//  newInfoTableViewCell.swift
//  GitLab_CL
//
//  Created by cs on 2018/8/27.
//  Copyright © 2018年 cs. All rights reserved.
//

import UIKit

class newInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var infoImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
