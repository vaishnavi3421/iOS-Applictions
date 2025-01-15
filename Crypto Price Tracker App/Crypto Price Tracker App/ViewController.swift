//
//  ViewController.swift
//  Crypto Price Tracker App
//
//  Created by Vaishnavi Wahgule on 15/01/25.
//

import UIKit

class ViewController: UIViewController {

    
        @IBOutlet weak var btcPrice: UILabel!
        @IBOutlet weak var ethPrice: UILabel!
        @IBOutlet weak var usdPrice: UILabel!
        @IBOutlet weak var audPrice: UILabel!
        @IBOutlet weak var lastUpdatedPrice: UILabel!
    
    let urlString = "https://api.coingecko.com/api/v3/exchange_rates"
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        
        let timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(refreshData), userInfo: nil, repeats: true)
    }
     @objc func refreshData() -> Void {
        fetchData()
    }

    func fetchData() {
        let url = URL(string: urlString)
        let defaultSession = URLSession(configuration: .default)
        let dataTask = defaultSession.dataTask(with: url!) { (data: Data?, response: URLResponse?,error: Error?) in
            
            if error != nil {
                print(error)
                return
            }
            
            do {
                let json = try JSONDecoder().decode(Price.self, from: data!)
                self.setPrices(currency: json.rates)
            } catch {
                print(error)
                return
            }
        }
        dataTask.resume()
    }
    
    func setPrices(currency: Currency)
    {
        DispatchQueue.main.async { [self] in
            self.btcPrice.text = self.FormatPrice(currency.btc)
            self.ethPrice.text = self.FormatPrice(currency.eth)
            self.usdPrice.text = self.FormatPrice(currency.usd)
            self.audPrice.text = self.FormatPrice(currency.aud)
            self.lastUpdatedPrice.text = self.formatDate(date: Date())
           
        }
        
    }
    func FormatPrice(_ rate:Rate) -> String
    {
        return String(format: "%@ %.4f", rate.unit , rate.value)
    }
    func formatDate(date:Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM y HH:mm:ss"
        return formatter.string(from: date)
    }
}

