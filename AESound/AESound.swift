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
    
    public class func play(soundPath: String) {
        var soundID: SystemSoundID = 0
        let pathURL = NSURL(fileURLWithPath: soundPath)
        AudioServicesCreateSystemSoundID(pathURL as CFURLRef, &soundID)
        play(soundID)
    }
    
    public class func play(soundID: SystemSoundID) {
        AudioServicesPlaySystemSound(soundID)
    }
    
}

// MARK: - AESoundTableViewController

public class AESoundTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    static let root = NSURL(string: "/System/Library/Audio/UISounds/")!
    var directories = [root]
    var files = [NSURL]()
    
    var sounds = [String : [NSURL]]()
    
    // MARK: - Lifecycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        loadPaths()
        loadSounds()
        print(directories)
    }
    
    // MARK: - Helpers
    
    /// - NOTE: This method will only work on device, not on simulator!
    func loadPaths() {
        let fileManager = NSFileManager.defaultManager()
        let keys = [NSURLIsDirectoryKey]
        
        guard let
            url = NSURL(string: "/System/Library/Audio/UISounds"),
            enumerator = fileManager.enumeratorAtURL(url, includingPropertiesForKeys: keys, options: [], errorHandler: nil)
            else { return }
        
        for object in enumerator {
            guard let url = object as? NSURL else { return }
            do {
                var resource: AnyObject?
                try url.getResourceValue(&resource, forKey: NSURLIsDirectoryKey)
                guard let isDirectory = (resource as? NSNumber)?.boolValue else { return }
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
            if let path = dir.path {
                sounds[path] = soundsForPath(path)
            }
        }
    }
    
    func soundsForPath(path: String) -> [NSURL] {
        var result = [NSURL]()
        for file in files {
            if let filePath = file.URLByDeletingLastPathComponent?.path where filePath == path {
                result.append(file)
            }
        }
        return result
    }
    
    // MARK: - UITableViewDataSource
    
    public override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return directories.count
    }
    
    public override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let dir = directories[section]
        return dir.path
    }
    
    public override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let key = directories[section].path else { return 0 }
        return sounds[key]?.count ?? 0
    }
    
    public override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let defaultCell = UITableViewCell(style: .Subtitle, reuseIdentifier: "Cell")
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") ?? defaultCell
        
        if let directory = directories[indexPath.section].path, soundsFromDirectory = sounds[directory] {
            let sound = soundsFromDirectory[indexPath.row]
            cell.textLabel?.text = sound.lastPathComponent
            cell.detailTextLabel?.text = sound.path
        }
        
        return cell
    }
    
    public override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        guard let path = files[indexPath.row].path else { return }
        AESound.play(path)
    }
    
}
