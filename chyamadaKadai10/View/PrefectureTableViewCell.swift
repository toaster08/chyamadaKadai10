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

    func clearLabel() {
        prefectureNameLabel.text = nil
        prefectureCodeNumberLabel.text = nil
    }

    func configureLabel(of prefecture: Prefecture) {
        prefectureNameLabel.text = prefecture.name
        prefectureCodeNumberLabel.text = String(describing: prefecture.codeNumber)
    }

    func configureColor(of cell: UITableViewCell, in color:() -> UIColor) {
        cell.backgroundColor = color()
    }
}
