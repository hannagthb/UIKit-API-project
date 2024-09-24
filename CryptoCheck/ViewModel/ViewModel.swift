//
//  ViewModel.swift
//  CryptoCheck
//
//  Created by Hanna Che on 16/09/2024.
//

import Foundation
import UIKit

class ViewModel {
    
    var results: [CryptoBasic] = []
    var tickers: Tickers?
    
    let coinsCount  = UILabel()
    let activeMarkets = UILabel()
    let totalMcap = UILabel()
    let totalVolume = UILabel()
    let btcD = UILabel()
    let ethD = UILabel()
    let mcapChange = UILabel()
    let volumeChange = UILabel()
    let avgChangePercent = UILabel()
    let volumeAth = UILabel()
    let mcapAth = UILabel()
    
    weak var view: UIView?
    
    let scroll = UIScrollView()
    
    var tableView = UITableView()
    
    var background = UIView()
    
    let urlStringForGlobalData = "https://api.coinlore.net/api/global/"
    let urlStringForAllCoins = "https://api.coinlore.net/api/tickers/"
    
    var name: String?
    var symbol: String?
    var priceUSD: String?
    var marketCapUSD: String?
    var percentChange24H: String?
    var percentChange1H: String?
    var percentChange7: String?
    
    func setView(in view: UIView) {
        self.view = view
        
        view.addSubview(scroll)
        
        coinsCount.translatesAutoresizingMaskIntoConstraints = false
        coinsCount.textColor = .white
        
        activeMarkets.translatesAutoresizingMaskIntoConstraints = false
        activeMarkets.textColor = .white
        
        totalMcap.translatesAutoresizingMaskIntoConstraints = false
        totalMcap.textColor = .white
        
        totalVolume.translatesAutoresizingMaskIntoConstraints = false
        totalVolume.textColor = .white
        
        btcD.translatesAutoresizingMaskIntoConstraints = false
        btcD.textColor = .white
        
        ethD.translatesAutoresizingMaskIntoConstraints = false
        ethD.textColor = .white
        
        mcapChange.translatesAutoresizingMaskIntoConstraints = false
        mcapChange.textColor = .white
        
        volumeChange.translatesAutoresizingMaskIntoConstraints = false
        volumeChange.textColor = .white
        
        avgChangePercent.translatesAutoresizingMaskIntoConstraints = false
        avgChangePercent.textColor = .white
        
        volumeAth.translatesAutoresizingMaskIntoConstraints = false
        volumeAth.textColor = .white
        
        mcapAth.translatesAutoresizingMaskIntoConstraints = false
        mcapAth.textColor = .white
        
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.addSubview(coinsCount)
        scroll.addSubview(activeMarkets)
        scroll.addSubview(totalMcap)
        scroll.addSubview(totalVolume)
        scroll.addSubview(btcD)
        scroll.addSubview(ethD)
        scroll.addSubview(mcapChange)
        scroll.addSubview(volumeChange)
        scroll.addSubview(avgChangePercent)
        scroll.addSubview(volumeAth)
        scroll.addSubview(mcapAth)
        scroll.showsHorizontalScrollIndicator = false
        
        NSLayoutConstraint.activate([
            scroll.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scroll.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -300),
            scroll.widthAnchor.constraint(equalTo: view.widthAnchor),
            scroll.heightAnchor.constraint(equalToConstant: 50) 
        ])
        
        NSLayoutConstraint.activate([
            coinsCount.leadingAnchor.constraint(equalTo: scroll.contentLayoutGuide.leadingAnchor, constant: 5),
            coinsCount.centerYAnchor.constraint(equalTo: scroll.centerYAnchor),

            activeMarkets.leadingAnchor.constraint(equalTo: coinsCount.trailingAnchor, constant: 20),
            activeMarkets.centerYAnchor.constraint(equalTo: scroll.centerYAnchor),

            totalMcap.centerYAnchor.constraint(equalTo: scroll.centerYAnchor),
            totalMcap.leadingAnchor.constraint(equalTo: activeMarkets.trailingAnchor, constant: 20),
            
            totalVolume.centerYAnchor.constraint(equalTo: scroll.centerYAnchor),
            totalVolume.leadingAnchor.constraint(equalTo: totalMcap.trailingAnchor, constant: 20),
            
            btcD.centerYAnchor.constraint(equalTo: scroll.centerYAnchor),
            btcD.leadingAnchor.constraint(equalTo: totalVolume.trailingAnchor, constant: 20),
            
            ethD.centerYAnchor.constraint(equalTo: scroll.centerYAnchor),
            ethD.leadingAnchor.constraint(equalTo: btcD.trailingAnchor, constant: 20),
            
            mcapChange.centerYAnchor.constraint(equalTo: scroll.centerYAnchor),
            mcapChange.leadingAnchor.constraint(equalTo: ethD.trailingAnchor, constant: 20),
            
            volumeChange.centerYAnchor.constraint(equalTo: scroll.centerYAnchor),
            volumeChange.leadingAnchor.constraint(equalTo: mcapChange.trailingAnchor, constant: 20),
            
            avgChangePercent.centerYAnchor.constraint(equalTo: scroll.centerYAnchor),
            avgChangePercent.leadingAnchor.constraint(equalTo: volumeChange.trailingAnchor, constant: 20),
            
            volumeAth.centerYAnchor.constraint(equalTo: scroll.centerYAnchor),
            volumeAth.leadingAnchor.constraint(equalTo: avgChangePercent.trailingAnchor, constant: 20),

            mcapAth.centerYAnchor.constraint(equalTo: scroll.centerYAnchor),
            mcapAth.leadingAnchor.constraint(equalTo: volumeAth.trailingAnchor, constant: 20),
            mcapAth.trailingAnchor.constraint(equalTo: scroll.contentLayoutGuide.trailingAnchor, constant: -20)
       ])
    }
   
    func fetchGlobalData() {
        guard let url = URL(string: urlStringForGlobalData) else {
            print("Can't get url")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let decodedData = try decoder.decode([CryptoBasic].self, from: data)
                        DispatchQueue.main.async {
                            self.results = decodedData
                            self.upDateUIGlobal()
                        }
                    } catch {
                        print("Error decoding JSON global data: \(error.localizedDescription)")
                    }
                } else if let error = error {
                    print("Error fetching data: \(error.localizedDescription)")
                }
            }.resume()
    }
    
    func fetchAllCoins() {
        guard let url = URL(string: urlStringForAllCoins) else {
            print("Can't get url")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let decodedData = try decoder.decode(Tickers.self, from: data)
                        DispatchQueue.main.async {
                            self.tickers = decodedData
                            self.updateUICoins()
                            self.tableView.reloadData()
                        }
                    } catch {
                        print("Error decoding JSON all coins: \(error.localizedDescription)")
                    }
                } else if let error = error {
                    print("Error fetching data: \(error.localizedDescription)")
                }
            }.resume()
    }
    
    func upDateUIGlobal() {
        for i in results {
            coinsCount.text = "Cryptocurrencies: \(String(i.coinsCount))"
            activeMarkets.text = "Markets: \(String(i.activeMarkets))"
            totalMcap.text = "Market cap: \(String(i.totalMcap))"
            totalVolume.text = "Volume sum 24h: \(String(i.totalVolume))"
            btcD.text = "BTC dominance: \(i.btcD)"
            ethD.text = "ETH dominance: \(i.ethD)"
            mcapChange.text = "Market cap 24h: \(i.mcapChange)"
            volumeChange.text = "Volume 24h: \(i.volumeChange)"
            avgChangePercent.text = "Prices: \(i.avgChangePercent)"
            volumeAth.text = "Volume ATH: \(i.volumeChange)"
            mcapAth.text = "Market cap ATH: \(String(i.mcapAth))"
        }
    }
    
    func updateUICoins() {
        if let result = tickers?.data {
            for i in result {
                name = i.name
                symbol = i.symbol
                priceUSD = i.priceUsd
                marketCapUSD = i.marketCapUsd
                percentChange24H = i.percentChange24H
                percentChange1H = i.percentChange1H
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func setBackground (in view: UIView) {
        view.addSubview(background)
        background.translatesAutoresizingMaskIntoConstraints = false
        background.backgroundColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        background.layer.cornerRadius = 50
        background.layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            background.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            background.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            background.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),
            background.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.9)
        ])
    }
    
    func fetchAllData() {
        fetchGlobalData()
        fetchAllCoins()
    }
    
    func setTableView(in view: UIView) {
        background.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundView = nil
        tableView.insetsContentViewsToSafeArea = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: background.topAnchor, constant: 50),
            tableView.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
}

extension MainVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      let count = viewModel.tickers?.data.count ?? 0
      return count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else {
            fatalError("Unable to dequeue TableViewCell")
        }
        
        if let coin = viewModel.tickers?.data[indexPath.row] {
            cell.configure(with: coin)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let coin = viewModel.tickers?.data[indexPath.row] else {
            return
        }
        
        let detailVC = DetailVC()
        detailVC.coin = coin
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}

