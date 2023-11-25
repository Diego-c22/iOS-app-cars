//
//  CarTableViewController.swift
//  tablesStoryboards
//
//  Created by J Antonio Enciso S on 23/09/22.
//

import UIKit
var carSelected: Car?

class CarTableViewController: UITableViewController {
    
    var cars = [Car]()

    @IBAction func Nav(_ sender: Any) {
        performSegue(withIdentifier: "StoryMap", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleCars()

        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "CarDetailsID" {return}
        if let indexPath = tableView.indexPathForSelectedRow {
            let selectedCar = cars[indexPath.row]
            if let destination = segue.destination as? ViewController {
                destination.selectedCar = selectedCar
            }
        }
            
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return cars.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "CarTableViewCell"

        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CarTableViewCell  else {
            fatalError("The dequeued cell is not an instance of CarTableViewCell.")
        }
        
        let car = cars[indexPath.row]
        
        cell.carLabel.text = car.model + " " + car.brand + " " + String(car.year)
        cell.carImage.image = UIImage(named: car.photo)
        cell.carDescription.text = String(car.price)
        
        return cell
    }
    
    
    
    private func loadSampleCars(){
        
        guard let car1 = Car(engine: "V4", photo: "cx3", garantee: "8 years", kilometers: 0, year: 2022, price: 430_000, brand: "MAZDA", model: "CX3")
        else {
            fatalError("Unable to instantiate car1")
        }
        
        guard let car2 = Car(engine: "V6", photo: "cx5", garantee: "8 years", kilometers: 0, year: 2023, price: 650_000, brand: "MAZDA", model: "cx5")
        else {
            fatalError("Unable to instantiate car2")
        }
        
        guard let car3 = Car(engine: "L3", photo: "m2", garantee: "4 years", kilometers: 0, year: 2023, price: 380_000, brand: "MAZDA", model: "2")
        else {
            fatalError("Unable to instantiate car3")
        }
        
        guard let car4 = Car(engine: "V4", photo: "mazda3", garantee: "6 years", kilometers: 0, year: 2023, price: 560_000, brand: "MAZDA", model: "3")
        else {
            fatalError("Unable to instantiate car3")
        }

        guard let car5 = Car(engine: "V4 Bi-Turbo", photo: "mx5", garantee: "8 years", kilometers: 0, year: 2023, price: 670_000, brand: "MAZDA", model: "MX-5")
        else {
            fatalError("Unable to instantiate car3")
        }

        
        cars += [car1, car2, car3, car4, car5]
        
        
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
