//
//  ListTableViewCell.swift
//  Assignment
//
//  Created by Greenapex on 06/02/23.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var createdDateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
