//
//  DeviceController.swift
//  3.3 Paired Assignment
//
//  Created by Jake Gloschat on 2/15/23.
//

import Foundation

class DeviceController {
    
    // MARK: - Properties
    static let shared = DeviceController()
    var devices: [Device] = []
    
    init() {
        load()
    }
    // MARK: - CRUD
    
    func createDevice (device: String) {
        let newDevice = Device(name: device)
        devices.append(newDevice)
        save()
    }
    
    func toggleIsOn(toggle: Device) {
        toggle.isOn.toggle()
        save()
    }
    
    // MARK: - Persistence
    private var url: URL? {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        else { return nil }
        let url = documentsDirectory.appendingPathComponent("device.json")
        return url
    }
    
    func save() {
        guard let url = url else { return }
        do {
            let data = try JSONEncoder().encode(devices)
            try data.write(to: url)
        } catch {
            print("Error saving devices", error.localizedDescription)
        }
    }
    
    func load () {
        guard let url = url else { return }
        do {
            let data = try Data(contentsOf: url)
            let device = try JSONDecoder().decode([Device].self, from: data)
            self.devices = device
        } catch {
            print("Error loading devices", error.localizedDescription)
        }
    }
    
    
    
} // End of Class
