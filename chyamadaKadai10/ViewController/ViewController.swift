//
//  ViewController.swift
//  chyamadaKadai10
//
//  Created by toaster on 2021/08/27.
//

import UIKit

final class ViewController: UIViewController {
    let nibCellName = "PrefectureTableViewCell"
    let nibId = "Cell"

    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            let nib = UINib(nibName: nibCellName, bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: nibId)
        }
    }

    private var prefectures = PrefectureModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        let apiClient = APIClient.shared
        apiClient.getPrefecture(completion: {[weak self] prefectures in
            self?.prefectures = prefectures
            self?.tableView.reloadData()
        })
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prefectures.prefecture.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: nibId) as? PrefectureTableViewCell else {
            fatalError("The dequeued cell is not instance")
        }

        let prefecture = prefectures.prefecture[indexPath.row]

        cell.clearLabel()
        cell.configureLabel(of: prefecture)
        cell.configureColor(of: cell) {
            switch indexPath.row % 3 {
            case 0: return #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
            case 1: return #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
            case 2: return #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
            default: return #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            }
        }

        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
}
