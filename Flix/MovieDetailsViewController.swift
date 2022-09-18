//
//  MovieDetailsViewController.swift
//  Flix
//
//  Created by Soupy Campbell on 9/7/22.
//

import UIKit
import AlamofireImage
import WebKit

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBAction func didTap(_ sender: UITapGestureRecognizer) {
        print("Did tap", sender)
        performSegue(withIdentifier: "trailerSegue", sender: nil)
    }
    
    
    var movie: [String: Any]!
    var videos = [[String: Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        
        synopsisLabel.text = movie["overview"] as? String
        synopsisLabel.sizeToFit()
        
        let posterPath = movie["poster_path"] as! String
        let basePosterURL = "https://image.tmdb.org/t/p/w185"
        let posterURL = URL(string: basePosterURL + posterPath)
        
        posterView.af.setImage(withURL: posterURL!)
        
        
        let backdropPath = movie["backdrop_path"] as! String
        let baseBackdropURL = "https://image.tmdb.org/t/p/w780"
        let backdropURL = URL(string: baseBackdropURL + backdropPath)
        
        backdropView.af.setImage(withURL: backdropURL!)
        
        // Do any additional setup after loading the view.
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
            
        let webViewController = segue.destination as! WebViewController
        webViewController.id = movie["id"] as? Int
        
    }
    

}
