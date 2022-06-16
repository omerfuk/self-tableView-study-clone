//
//  VideoListVC.swift
//  Programmatic Study Self
//
//  Created by Ömer Faruk Kılıçaslan on 16.06.2022.
//

import UIKit

class VideoListVC: UIViewController {

    var videos:[Video] = []
    var tableView = UITableView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Omerfuk's Videos"
        navigationController?.navigationBar.prefersLargeTitles = true
        videos = fetchData()
        
        configureTableView()
        

        
    }
    
    func configureTableView(){
        
        //Add tableView to view
        view.addSubview(tableView)
        //set delegates
        setTableViewDelegates()
        //set row height
        tableView.rowHeight = 100
        //register cells
        tableView.register(VideoCell.self, forCellReuseIdentifier: Cells.videoCell)
        //set constraints
        tableView.pin(to: view)
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension VideoListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.videoCell ) as! VideoCell
        let video = videos[indexPath.row]
        cell.set(video: video)
        
        return cell
    }
}


extension VideoListVC {
    
    func fetchData() -> [Video] {
        
        let video1 = Video(imageName: Constants.manzara1, title: "Zart zurt")
        let video2 = Video(imageName: Constants.manzara2, title: "Zart zurt")
        let video3 = Video(imageName: Constants.manzara3, title: "Zart zurt")
        let video4 = Video(imageName: Constants.manzara4, title: "Zart zurt")
        let video5 = Video(imageName: Constants.manzara5, title: "Zart zurt")
        
        return [video1,video2,video3,video4,video5]
    }
    
    
}
