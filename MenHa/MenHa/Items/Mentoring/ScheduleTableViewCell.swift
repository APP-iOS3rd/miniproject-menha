//
//  ScheduleTableViewCell.swift
//  MenHa
//
//  Created by SeokkiKwon on 11/27/23.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {

    @IBOutlet var userImage: UIImageView!
    @IBOutlet var groupName: UILabel!
    @IBOutlet var prgressUnit: UILabel!
    @IBOutlet var progressData: UILabel!
    @IBOutlet weak var modifyBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
