import UIKit

final class HomeViewController: UIViewController {

    let sectionTitles = [
        "Trending",
        "Favorite",
        "New Releases",
        "Recomment",
        "Popular"
    ]

    @IBOutlet private weak var homeTableView: UITableView!

    @IBOutlet weak var imageHeaderView: UIImageView!

    private enum LayoutOptions {
        static let heightForRowAt: CGFloat = 200
        static let heightForHeaderInSection: CGFloat = 50
        static let textSizeHeader: CGFloat = 16
        static let numberOfRowsInSection: Int = 1
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        homeTableView.register(CollectionViewTableViewCell.nib,
                               forCellReuseIdentifier: CollectionViewTableViewCell.indentifier)
        homeTableView.delegate = self
        homeTableView.dataSource = self

        setupNaviBar()

        setupImageViewHeader()
    }

    private func setupImageViewHeader() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.clear.cgColor,
            UIColor.black.cgColor
        ]
        gradientLayer.frame = imageHeaderView.bounds
        imageHeaderView?.layer.addSublayer(gradientLayer)
    }

    private func setupNaviBar() {

        var imageLogo = UIImage(named: "logo")
        imageLogo = imageLogo?.withRenderingMode(.alwaysOriginal)

        let imageSearch = UIImage(systemName: "magnifyingglass")

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: imageLogo, style: .done, target: self, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: imageSearch, style: .done, target: self, action: nil)

        navigationController?.navigationBar.tintColor = .white
    }

}

extension HomeViewController: UITableViewDelegate {

}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LayoutOptions.numberOfRowsInSection
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CollectionViewTableViewCell.indentifier, for: indexPath) as? CollectionViewTableViewCell
        else {
            return UITableViewCell()
        }

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return LayoutOptions.heightForRowAt
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return LayoutOptions.heightForHeaderInSection
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = .systemFont(ofSize: LayoutOptions.textSizeHeader, weight: .semibold)
    }
}
