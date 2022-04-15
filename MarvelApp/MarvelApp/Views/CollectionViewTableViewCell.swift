import UIKit

final class CollectionViewTableViewCell: UITableViewCell, ReuseableView {

    @IBOutlet weak var collectionView: UICollectionView!

    private enum LayoutOptions {
        static let widthSizeForItemAt: CGFloat = 150
        static let heightSizeForItemAt: CGFloat = 196
        static let numberOfItemsInSection: Int = 10
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    private func setupView() {
        selectionStyle = .none
        collectionView.register(HomeCollectionViewCell.nib,
                                forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: LayoutOptions.widthSizeForItemAt, height: LayoutOptions.heightSizeForItemAt)
    }
}

extension CollectionViewTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return LayoutOptions.numberOfItemsInSection
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)
    -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier,
                                                      for: indexPath)
        cell.backgroundColor = .systemCyan
        cell.layer.cornerRadius = 7
        return cell
    }
}
