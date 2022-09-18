//
//  TableViewCell_Person.swift
//  DirectoryApp
//
//  Created by Emre Kocak on 13.09.2022.
//

import UIKit

class TableViewCell_Person: UITableViewCell {

    @IBOutlet weak var imageViewGender: UIImageView!
    @IBOutlet weak var labelNameSurname: UILabel!
    @IBOutlet weak var labelNumber: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
