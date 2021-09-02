//
//  PrefectureTableViewCell.swift
//  chyamadaKadai10
//
//  Created by toaster on 2021/08/27.
//

import UIKit

final class PrefectureTableViewCell: UITableViewCell {
    @IBOutlet private weak var prefectureNameLabel: UILabel!
    @IBOutlet private weak var prefectureCodeNumberLabel: UILabel! {
        didSet {
            prefectureCodeNumberLabel.font =
                UIFont.monospacedDigitSystemFont(ofSize: 15, weight: .regular)
        }
    }

    func configure(prefecture: Prefecture, row: Int) {
        prefectureNameLabel.text = prefecture.name
        prefectureCodeNumberLabel.text = String(describing: prefecture.codeNumber)

        let colors: [UIColor] = [#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1), #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1), #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)]
        backgroundColor = colors[row % colors.count]
    }
}
