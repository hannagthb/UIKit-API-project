//
//  DetailVC.swift
//  CryptoCheck
//
//  Created by Hanna Che on 23/09/2024.
//

import UIKit

class DetailVC: UIViewController {
    
    var coin: Datum?
    
    var symbol = UILabel()
    var name = UILabel()
    var nameid = UILabel()
    var rank = UILabel()
    var priceUsd = UILabel()
    var percentChange24H = UILabel()
    var percentChange1H = UILabel()
    var percentChange7D = UILabel()
    var priceBtc = UILabel()
    var marketCapUsd = UILabel()
    var volume24 = UILabel()
    var volume24A = UILabel()
    var csupply = UILabel()
    var tsupply = UILabel()
    var msupply = UILabel()
    
    var subTitle = UILabel()
    
    var marketCap = UILabel()
    var tradingVolume = UILabel()
    var range24 = UILabel()
    var range1h = UILabel()
    var range7d = UILabel()
    var tsupplyText = UILabel()
    var msupplyText = UILabel()
    var csupplyText = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }
    
    func setUI() {
        view.backgroundColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        
        view.addSubview(symbol)
        view.addSubview(name)
        view.addSubview(nameid)
        view.addSubview(rank)
        view.addSubview(priceUsd)
        view.addSubview(percentChange24H)
        view.addSubview(percentChange1H)
        view.addSubview(percentChange7D)
        view.addSubview(priceBtc)
        view.addSubview(marketCapUsd)
        view.addSubview(csupply)
        view.addSubview(tsupply)
        view.addSubview(msupply)
        view.addSubview(volume24)
        
        view.addSubview(subTitle)
        view.addSubview(marketCap)
        view.addSubview(tradingVolume)
        view.addSubview(range24)
        view.addSubview(range1h)
        view.addSubview(range7d)
        view.addSubview(tsupplyText)
        view.addSubview(msupplyText)
        view.addSubview(csupplyText)

        
        name.translatesAutoresizingMaskIntoConstraints = false
        name.textColor = .white
        name.text = coin?.name
        name.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        
        symbol.translatesAutoresizingMaskIntoConstraints = false
        symbol.textColor = .white
        symbol.text = coin?.symbol
        
        nameid.translatesAutoresizingMaskIntoConstraints = false
        nameid.textColor = .white
        nameid.text = coin?.nameid
        
        rank.translatesAutoresizingMaskIntoConstraints = false
        rank.textColor = .white
        rank.text = "\(coin?.rank ?? 0)"
        
        priceUsd.translatesAutoresizingMaskIntoConstraints = false
        priceUsd.textColor = .white
        priceUsd.text = "Live price: " + (coin?.priceUsd ?? "")
        priceUsd.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        priceUsd.textColor = .green
        
        volume24.translatesAutoresizingMaskIntoConstraints = false
        volume24.textColor = .white
        volume24.text = "\(coin?.volume24 ?? 0.0)"
        
        percentChange24H.translatesAutoresizingMaskIntoConstraints = false
        percentChange24H.textColor = .white
        percentChange24H.text = coin?.percentChange24H
        
        percentChange1H.translatesAutoresizingMaskIntoConstraints = false
        percentChange1H.textColor = .white
        percentChange1H.text = coin?.percentChange1H
        
        percentChange7D.translatesAutoresizingMaskIntoConstraints = false
        percentChange7D.textColor = .white
        percentChange7D.text = coin?.percentChange7D
        
        priceBtc.translatesAutoresizingMaskIntoConstraints = false
        priceBtc.textColor = .white
        priceBtc.text = "Coin costs in BTC: " + (coin?.priceBtc ?? "")
        
        csupply.translatesAutoresizingMaskIntoConstraints = false
        csupply.textColor = .white
        csupply.text = coin?.csupply
        
        tsupply.translatesAutoresizingMaskIntoConstraints = false
        tsupply.textColor = .white
        tsupply.text = coin?.tsupply
        
        msupply.translatesAutoresizingMaskIntoConstraints = false
        msupply.textColor = .white
        msupply.text = coin?.msupply
        
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        subTitle.textColor = .white
        subTitle.text = "Price Stats"
        subTitle.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        
        marketCap.translatesAutoresizingMaskIntoConstraints = false
        marketCap.textColor = .white
        marketCap.text = "Market Cap"
        
        tradingVolume.translatesAutoresizingMaskIntoConstraints = false
        tradingVolume.textColor = .white
        tradingVolume.text = "Trading Volume"
        
        range24.translatesAutoresizingMaskIntoConstraints = false
        range24.textColor = .white
        range24.text = "24h Range"
        
        tsupplyText.translatesAutoresizingMaskIntoConstraints = false
        tsupplyText.textColor = .white
        tsupplyText.text = "Total Supply"
        
        msupplyText.translatesAutoresizingMaskIntoConstraints = false
        msupplyText.textColor = .white
        msupplyText.text = "Max Supply"
        
        csupplyText.translatesAutoresizingMaskIntoConstraints = false
        csupplyText.textColor = .white
        csupplyText.text = "Circulating Supply"
        
        range1h.translatesAutoresizingMaskIntoConstraints = false
        range1h.textColor = .white
        range1h.text = "1h Range"
        
        range7d.translatesAutoresizingMaskIntoConstraints = false
        range7d.textColor = .white
        range7d.text = "7d Range"
        
        NSLayoutConstraint.activate([
            name.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            name.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            symbol.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 5),
            symbol.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35)
        ])
        
        NSLayoutConstraint.activate([
            nameid.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 5),
            nameid.leadingAnchor.constraint(equalTo: symbol.trailingAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            priceUsd.topAnchor.constraint(equalTo: symbol.bottomAnchor, constant: 30),
            priceUsd.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35)
        ])
        
        NSLayoutConstraint.activate([
            priceBtc.topAnchor.constraint(equalTo: priceUsd.bottomAnchor, constant: 5),
            priceBtc.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35)
        ])
        
        
        NSLayoutConstraint.activate([
            subTitle.topAnchor.constraint(equalTo: priceBtc.bottomAnchor, constant: 30),
            subTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35)
        ])
        
        NSLayoutConstraint.activate([
            marketCap.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 5),
            marketCap.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35)
        ])
        
        NSLayoutConstraint.activate([
            rank.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 5),
            rank.leadingAnchor.constraint(equalTo: marketCap.trailingAnchor, constant: 100)
        ])
        
        NSLayoutConstraint.activate([
            tradingVolume.topAnchor.constraint(equalTo: marketCap.bottomAnchor, constant: 5),
            tradingVolume.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35)
        ])
        
        NSLayoutConstraint.activate([
            volume24.topAnchor.constraint(equalTo: rank.bottomAnchor, constant: 5),
            volume24.leadingAnchor.constraint(equalTo: tradingVolume.trailingAnchor, constant: 70)
        ])
        
        NSLayoutConstraint.activate([
            tsupplyText.topAnchor.constraint(equalTo: tradingVolume.bottomAnchor, constant: 5),
            tsupplyText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35)
        ])
        
        NSLayoutConstraint.activate([
            tsupply.topAnchor.constraint(equalTo: volume24.bottomAnchor, constant: 5),
            tsupply.leadingAnchor.constraint(equalTo: tsupplyText.trailingAnchor, constant: 93)
        ])
        
        
        NSLayoutConstraint.activate([
            msupplyText.topAnchor.constraint(equalTo: tsupplyText.bottomAnchor, constant: 5),
            msupplyText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35)
        ])
        
        NSLayoutConstraint.activate([
            msupply.topAnchor.constraint(equalTo: tsupplyText.bottomAnchor, constant: 5),
            msupply.leadingAnchor.constraint(equalTo: msupplyText.trailingAnchor, constant: 97)
        ])
        
        NSLayoutConstraint.activate([
            range24.topAnchor.constraint(equalTo: msupplyText.bottomAnchor, constant: 5),
            range24.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35)
        ])
        
        NSLayoutConstraint.activate([
            percentChange24H.topAnchor.constraint(equalTo: msupplyText.bottomAnchor, constant: 5),
            percentChange24H.leadingAnchor.constraint(equalTo: range24.trailingAnchor, constant: 105)
        ])
        
        NSLayoutConstraint.activate([
            csupplyText.topAnchor.constraint(equalTo: range24.bottomAnchor, constant: 5),
            csupplyText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35)
        ])
        
        NSLayoutConstraint.activate([
            csupply.topAnchor.constraint(equalTo: range24.bottomAnchor, constant: 5),
            csupply.leadingAnchor.constraint(equalTo: csupplyText.trailingAnchor, constant: 49)
        ])
        
        NSLayoutConstraint.activate([
            range1h.topAnchor.constraint(equalTo: csupplyText.bottomAnchor, constant: 5),
            range1h.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35)
        ])
        
        NSLayoutConstraint.activate([
            percentChange1H.topAnchor.constraint(equalTo: csupplyText.bottomAnchor, constant: 5),
            percentChange1H.leadingAnchor.constraint(equalTo: range1h.trailingAnchor, constant: 117)
        ])
        
        NSLayoutConstraint.activate([
            range7d.topAnchor.constraint(equalTo: range1h.bottomAnchor, constant: 5),
            range7d.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35)
        ])
        
        NSLayoutConstraint.activate([
            percentChange7D.topAnchor.constraint(equalTo: range1h.bottomAnchor, constant: 5),
            percentChange7D.leadingAnchor.constraint(equalTo: range7d.trailingAnchor, constant: 115)
        ])
    }
}

#Preview {
    DetailVC()
}
