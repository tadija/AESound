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
    }
    
    // MARK: - Helpers
    
    /// - NOTE: This method will only work on device, not on simulator!
    func loadPaths() {
        let fileManager = NSFileManager.defaultManager()
        let keys = [NSURLIsDirectoryKey]
        
        guard let
            enumerator = fileManager.enumeratorAtURL(AESoundTableViewController.root,
                                                     includingPropertiesForKeys: keys, options: [], errorHandler: nil)
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
                sounds[path] = soundsForDirectoryPath(path)
            }
        }
    }
    
    func soundsForDirectoryPath(path: String) -> [NSURL] {
        var result = [NSURL]()
        for file in files {
            if let filePath = file.URLByDeletingLastPathComponent?.path where filePath == path {
                result.append(file)
            }
        }
        return result
    }
    
    func soundURLForIndexPath(indexPath: NSIndexPath) -> NSURL? {
        guard let
            directory = directories[indexPath.section].path,
            soundsFromDirectory = sounds[directory]
        else { return nil }
        
        let sortedSounds = soundsFromDirectory.sort {
            $0.path!.localizedCaseInsensitiveCompare($1.path!) == .OrderedAscending
        }
        let soundURL = sortedSounds[indexPath.row]
        return soundURL
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
        let defaultCell = UITableViewCell(style: .Value1, reuseIdentifier: "Cell")
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") ?? defaultCell
        
        if let soundURL = soundURLForIndexPath(indexPath) {
            cell.textLabel?.text = soundURL.lastPathComponent
            cell.detailTextLabel?.text = "\(indexPath.row + 1)"
        }
        
        return cell
    }
    
    public override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let soundURL = soundURLForIndexPath(indexPath), soundPath = soundURL.path {
            AESound.play(soundPath)
        }
    }
    
}
