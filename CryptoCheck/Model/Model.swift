//
//  Model.swift
//  CryptoCheck
//
//  Created by Hanna Che on 16/09/2024.
//

import Foundation

struct CryptoBasic: Codable {
    let coinsCount, activeMarkets: Int
    let totalMcap, totalVolume: Double
    let btcD, ethD, mcapChange, volumeChange: String
    let avgChangePercent: String
    let volumeAth, mcapAth: Double

    enum CodingKeys: String, CodingKey {
        case coinsCount = "coins_count"
        case activeMarkets = "active_markets"
        case totalMcap = "total_mcap"
        case totalVolume = "total_volume"
        case btcD = "btc_d"
        case ethD = "eth_d"
        case mcapChange = "mcap_change"
        case volumeChange = "volume_change"
        case avgChangePercent = "avg_change_percent"
        case volumeAth = "volume_ath"
        case mcapAth = "mcap_ath"
    }
}

struct Tickers: Codable {
    let data: [Datum]
    let info: Info
}

struct Datum: Codable {
    let id, symbol, name, nameid: String
    let rank: Int
    let priceUsd, percentChange24H, percentChange1H, percentChange7D: String
    let priceBtc, marketCapUsd: String
    let volume24, volume24A: Double
    let csupply, tsupply: String
    let msupply: String?

    enum CodingKeys: String, CodingKey {
        case id, symbol, name, nameid, rank
        case priceUsd = "price_usd"
        case percentChange24H = "percent_change_24h"
        case percentChange1H = "percent_change_1h"
        case percentChange7D = "percent_change_7d"
        case priceBtc = "price_btc"
        case marketCapUsd = "market_cap_usd"
        case volume24
        case volume24A = "volume24a"
        case csupply, tsupply, msupply
    }
}

struct Info: Codable {
    let coinsNum, time: Int

    enum CodingKeys: String, CodingKey {
        case coinsNum = "coins_num"
        case time
    }
}
