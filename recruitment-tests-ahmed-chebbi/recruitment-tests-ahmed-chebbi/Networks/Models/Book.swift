//
//  Book.swift
//  recruitment-tests-ahmed-chebbi
//
//  Created by Chebbi on 11/07/2021.
//

struct Book: Codable, Hashable {
    let isbn, title: String?
    let price: Int?
    let cover: String?
    let synopsis: [String]?
}
