//
//  DeviceTableViewCell.swift
//  3.3 Paired Assignment
//
//  Created by Jake Gloschat on 2/15/23.
//

import UIKit

protocol DeviceTableViewCellDelegate: AnyObject {
    func isOnSwitchToggled(_ cell: DeviceTableViewCell)
}


class DeviceTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var deviceNameLabel: UILabel!
    @IBOutlet weak var switchToggle: UISwitch!
    
    
    
    // MARK: - Properties
    weak var delegate: DeviceTableViewCellDelegate?
    
    // MARK: - Functions
    func updateViews(device: Device) {
        deviceNameLabel.text = device.name
    }
    func toggleImage(toggle: Device) {
        switchToggle.isOn = toggle.isOn
    }
    
    // MARK: - Actions
    
    @IBAction func switchToggleIsTapped(_ sender: Any) {
        delegate?.isOnSwitchToggled(self)
    }
}
