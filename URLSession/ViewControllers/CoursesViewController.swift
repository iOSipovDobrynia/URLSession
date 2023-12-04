//
//  ViewController.swift
//  URLSession
//
//  Created by Goodwasp on 04.12.2023.
//

import UIKit

final class CoursesViewController: UITableViewController {
    
    // MARK: - Private properties
    private let courses: [Course] = []
    
    // MARK: - View's lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCourses()
    }
    
    // MARK: - Private methods
    private func fetchCourses() {
        guard let url = URL(string: "https://iosacademy.io/api/v1/courses/index.php") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
        }
    }
}

// MARK: - UITableViewDataSource
extension CoursesViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
//        let course = courses[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = "DK"
//        content.text = course.name

//        content.imageProperties.cornerRadius = tableView.rowHeight / 2

        cell.contentConfiguration = content
        return cell
    }
}

