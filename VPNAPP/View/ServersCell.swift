//
//  ServersCell.swift
//  VPNAPP
//
//  Created by Petr Yanenko on 09.09.2021.
//

import UIKit

class ServersCell: UITableViewCell {
    
    @IBOutlet weak var icon:UIImageView!
    @IBOutlet weak var selectedIcon:UIImageView!
    @IBOutlet weak var serverName:UILabel!
    @IBOutlet weak var serverSubName:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        selectedIcon.image = UIImage(named: selected ? "selected_circle" : "circle")

        // Configure the view for the selected state
    }
    
}
