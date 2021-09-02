//
//  PrefectureModel.swift
//  chyamadaKadai10
//
//  Created by toaster on 2021/08/27.
//

import Foundation

struct Prefecture: Decodable {
    var name: String
    var codeNumber: Int

    enum CodingKeys: String, CodingKey {
        case name = "prefName"
        case codeNumber = "prefCode"
    }
}
