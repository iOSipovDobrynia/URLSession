//
//  ViewController.swift
//  URLSession
//
//  Created by Goodwasp on 04.12.2023.
//

import UIKit

final class CoursesViewController: UITableViewController {
    
    // MARK: - Private properties
    private var courses: [Course] = []
    private let networkService = NetworkService.shared
    
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
        
        networkService.fetchData(url: url) {[weak self] (result: Result<[Course], Error>) in
            switch result {
            case .success(let coursesFromJSON):
                DispatchQueue.main.async {
                    self?.courses = coursesFromJSON
                    self?.tableView.reloadData()
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension CoursesViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        courses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let course = courses[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = course.name

//        content.imageProperties.cornerRadius = tableView.rowHeight / 2

        cell.contentConfiguration = content
        return cell
    }
}

