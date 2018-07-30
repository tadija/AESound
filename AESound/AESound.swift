//
//  AESound.swift
//  Touch League
//
//  Created by Marko Tadic on 5/15/16.
//  Copyright © 2016 AE. All rights reserved.
//

import AudioToolbox
import UIKit

// MARK: - AESound

public class AESound {
    
    // MARK: - API
    
    public class func play(fromPath path: String) {
        var soundID: SystemSoundID = 0
        let pathURL = URL(fileURLWithPath: path)
        AudioServicesCreateSystemSoundID(pathURL as CFURL, &soundID)
        play(soundID)
    }
    
    public class func play(_ soundID: SystemSoundID) {
        AudioServicesPlaySystemSound(soundID)
    }
    
}

// MARK: - AESoundTableViewController

public class AESoundTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    static let rootURL = URL(string: "/System/Library/Audio/UISounds/")!
    var directories = [rootURL]
    var files = [URL]()
    
    var sounds = [String : [URL]]()
    
    // MARK: - Lifecycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        loadPaths()
        loadSounds()
    }
    
    // MARK: - Helpers
    
    /// - Note: This method will only work on device, not on simulator!
    func loadPaths() {
        let fileManager = FileManager.default
        let keys = [URLResourceKey.isDirectoryKey]
        
        guard let enumerator = fileManager.enumerator(at: AESoundTableViewController.rootURL,
                                                      includingPropertiesForKeys: keys)
        else { return }
        
        for object in enumerator {
            guard let url = object as? URL else { return }
            do {
                let resource = try url.resourceValues(forKeys: Set(keys))
                guard let isDirectory = resource.isDirectory else { return }
                if isDirectory {
                    directories.append(url)
                } else {
                    files.append(url)
                }
            } catch { print(error) }
        }
    }
    
    func loadSounds() {
        for dir in directories {
            let path = dir.path
            sounds[path] = soundsForDirectoryPath(path: path)
        }
    }
    
    func soundsForDirectoryPath(path: String) -> [URL] {
        var result = [URL]()
        for file in files {
            if file.deletingLastPathComponent().path == path {
                result.append(file)
            }
        }
        return result
    }
    
    func soundURL(for indexPath: IndexPath) -> URL? {
        let directory = directories[indexPath.section].path
        guard let soundsFromDirectory = sounds[directory]
        else { return nil }
        
        let sortedSounds = soundsFromDirectory.sorted {
            $0.path.localizedCaseInsensitiveCompare($1.path) == .orderedAscending
        }
        let soundURL = sortedSounds[indexPath.row]
        return soundURL
    }
    
    // MARK: - UITableViewDataSource

    public override func numberOfSections(in tableView: UITableView) -> Int {
        return directories.count
    }
    
    public override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let dir = directories[section]
        return dir.path
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = directories[section].path
        return sounds[key]?.count ?? 0
    }

    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let defaultCell = UITableViewCell(style: .value1, reuseIdentifier: "Cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") ?? defaultCell

        if let soundURL = soundURL(for: indexPath) {
            cell.textLabel?.text = soundURL.lastPathComponent
            cell.detailTextLabel?.text = "\(indexPath.row + 1)"
        }

        return cell
    }

    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let soundURL = soundURL(for: indexPath) {
            AESound.play(fromPath: soundURL.path)
        }
    }
    
}
