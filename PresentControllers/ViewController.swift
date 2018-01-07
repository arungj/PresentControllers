//
//  ViewController.swift
//  PresentControllers
//
//  Created by Arun George on 9/29/17.
//  Copyright © 2017 GJ. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
//    var styles: [UIModalPresentationStyle]!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        styles = [.fullScreen,
//            .pageSheet,
//            .formSheet,
//            .overFullScreen,
//            .currentContext,
//            .overCurrentContext]
//    }
    
        var styles: [[String : UIModalPresentationStyle]]!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            styles = [["fullScreen" : .fullScreen], ////The views belonging to the presenting view controller are removed after the presentation completes.
                      ["pageSheet" : .pageSheet],   // same as fullscreen in portrait compact. Bigger canvas than formSheet.
                      ["formSheet" : .formSheet],
                ["overFullScreen" : .overFullScreen],
                ["currentContext" : .currentContext],
                ["overCurrentContext" : .overCurrentContext]]
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewController(from storyboard: String, identifier: String) -> UIViewController? {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return styles.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let value = styles[indexPath.row].keys.first
        cell?.textLabel?.text = value
        
        return cell!
    }
    
    // MARK: Tableview delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "viewcontroller2")
        
        let presentationStyle = styles[indexPath.row].values.first!
        viewController.modalPresentationStyle = presentationStyle
        switch presentationStyle {
        case .overCurrentContext, .overFullScreen:
            viewController.view.backgroundColor = viewController.view.backgroundColor?.withAlphaComponent(0.5)
        default:
            break
        }
        
        present(viewController, animated: true)
    }
}

