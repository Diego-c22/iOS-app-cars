//
//  CountryTableViewController.swift
//  tablesStoryboards
//
//  Created by Diego Cortes on 05/12/23.
//

import UIKit

class CountryTableViewController: UITableViewController {
    let reuseIdentifier = "CountryCell"
      
      var countries: [Country]? {
        didSet {
          DispatchQueue.main.async { [self] in
            tableView.reloadData()
          }
        }
      }
      
      // MARK: - Lifecycle
      
      override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        
        let countryManager = CountryManager()
        
        countryManager.fetch { (countries) in
          self.countries = countries
        }
      }

      // MARK: - Helpers
      
      func configureTableView() {
        tableView.backgroundColor = .lightGray
        tableView.tableFooterView = UIView()
      }

    }

struct Name: Decodable {
let common: String
    let official: String
}
    
struct Country: Decodable {
    let name: Name
    let region: String
    let capital: [String]
}

struct CountryManager {
    func fetch (completion: @escaping([Country]) -> Void) {
        guard let url = URL(string: "https://restcountries.com/v3.1/all?fields=area,name,region,capital") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {data, _,
            error in
            if let error = error {
              print("Error fetching Countries: \(error.localizedDescription)")
            }
            guard let jsonData = data else {
                return
            }
            // Convert to JSON
            
            do {
                let countries = try JSONDecoder().decode([Country].self, from: jsonData)
                completion(countries)
            }catch {
                print(error)
            }

        }
        
        task.resume()
        
    }
}


extension CountryTableViewController {
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return countries?.count ?? 0
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
    
    guard let country = countries?[indexPath.row] else { return UITableViewCell() }
    
      cell.textLabel?.text = "\(country.name.common) - \(country.capital[0]) - \(country.region)"
    
    return cell
  }
  
}
