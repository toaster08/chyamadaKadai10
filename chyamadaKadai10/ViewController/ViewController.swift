//
//  ViewController.swift
//  chyamadaKadai10
//
//  Created by toaster on 2021/08/27.
//

import UIKit

protocol APIClientProtocol {
    func getPrefecture(completion: @escaping ((PrefectureModel) -> Void))
}

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

        let apiClient: APIClientProtocol = APIClientMock()
        //        let apiClient: APIClientProtocol = APIClient()

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

        cell.configure(prefecture: prefecture, row: indexPath.row)

        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
}
