//
//  ThingHucreTableViewCell.swift
//  ToDoApp
//
//  Created by Ekin Atasoy on 5.09.2022.
//

import UIKit

class ThingHucreTableViewCell: UITableViewCell {

    @IBOutlet weak var thingCellLabel: UILabel!
    @IBOutlet weak var importanceImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
