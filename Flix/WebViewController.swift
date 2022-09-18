//
//  WebViewController.swift
//  Flix
//
//  Created by Soupy Campbell on 9/7/22.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate  {

    @IBOutlet weak var webView: WKWebView!
    
    var id: Int!
    
    @IBAction func buttonClose(_ sender: Any) {
            dismiss(animated: true, completion: nil)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Network Video Request
        let videoUrl = URL(string: "https://api.themoviedb.org/3/movie/\(id!)/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US")!
        let videoRequest = URLRequest(url: videoUrl, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let videoSession = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let videoTask = videoSession.dataTask(with: videoRequest) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]

                    // TODO: Get the array of movies
                    // TODO: Store the movies in a property to use elsewhere
                    // TODO: Reload your table view data
                 
                 let videos = dataDictionary["results"] as! [[String:Any]]
                 
                 let videoBaseURL = "https://www.youtube.com/watch?v="
                 let video = videos[0]
                 let videoKey = video["key"] as! String
                 let videoLink = videoBaseURL + videoKey
                 print("Web View", videoLink)
                 let Link = URL(string: videoLink)
                 let request = URLRequest(url: Link!)
                 self.webView.load(request)
             }
        }
        videoTask.resume()
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
