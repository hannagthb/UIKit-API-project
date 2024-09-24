//
//  TableViewCell.swift
//  CryptoCheck
//
//  Created by Hanna Che on 20/09/2024.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var viewModel: ViewModel?
    
    static let identifier = "Detail"
    
    let backgroundContainer = UIView()
    
    let name = UILabel()
    let symbol = UILabel()
    let priceUSD = UILabel()
    let percentChange24H = UILabel()
    let percentChange24HInt = -90
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        
        setupBackgroundContainer()
        
        setCellLooks()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func nib() -> UINib {
        return UINib(nibName: "Detail", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setupBackgroundContainer() {
        backgroundContainer.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        backgroundContainer.layer.cornerRadius = 30
        backgroundContainer.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(backgroundContainer)
        
        NSLayoutConstraint.activate([
            backgroundContainer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            backgroundContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            backgroundContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            backgroundContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    func configure(with coin: Datum) {
            name.text = coin.name
            symbol.text = coin.symbol
            priceUSD.text = coin.priceUsd
            percentChange24H.text = coin.percentChange24H
            
            if let percentChange = Double(coin.percentChange24H) {
                percentChange24H.textColor = percentChange < 0 ? .red : .green
            }
        }
    
    func setCellLooks() {
        contentView.addSubview(name)
        
        name.text = viewModel?.name
        name.textColor = .white
        name.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        name.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            name.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -5)
        ])
        
        contentView.addSubview(symbol)
        symbol.text = viewModel?.symbol
        symbol.textColor = .white
        symbol.translatesAutoresizingMaskIntoConstraints = false
        symbol.font = UIFont.systemFont(ofSize: 10)
        
        NSLayoutConstraint.activate([
            symbol.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            symbol.topAnchor.constraint(equalTo: name.bottomAnchor)
        ])
        
        contentView.addSubview(priceUSD)
        priceUSD.text = viewModel?.priceUSD
        priceUSD.textColor = .white
        priceUSD.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            priceUSD.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            priceUSD.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        contentView.addSubview(percentChange24H)
        percentChange24H.text = viewModel?.percentChange24H
        if percentChange24HInt < 0 {
            percentChange24H.textColor = .red
        }else {
            percentChange24H.textColor = .green
        }
        
        percentChange24H.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            percentChange24H.trailingAnchor.constraint(equalTo: priceUSD.trailingAnchor, constant: -100),
            percentChange24H.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}

#Preview {
    TableViewCell()
}
