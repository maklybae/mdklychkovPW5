//
//  ArticleCell.swift
//  mdklychkovPW5
//
//  Created by Maksim Klychkov on 26.12.2024.
//

import UIKit
import Kingfisher
import SkeletonView

final class ArticleCell: UITableViewCell {
    // MARK: - Static variables
    public static let reuseIdentifier = "ArticleCell"

    // MARK: - Constants

    // MARK: - Subviews
    private let articleImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.kf.indicatorType = .none
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.isSkeletonable = true
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textColor = .darkGray
        return label
    }()
    
    private let wrap: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()

    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    // MARK: - Setup
    private func setupViews() {
        contentView.addSubview(wrap)
        wrap.pin(to: contentView)
        
        wrap.addSubview(articleImageView)
        wrap.addSubview(titleLabel)
        wrap.addSubview(descriptionLabel)

        articleImageView.pinTop(to: wrap)
        articleImageView.pinHeight(to: wrap.widthAnchor, 9.0 / 16.0)
        articleImageView.pinHorizontal(to: wrap)
        
        titleLabel.pinTop(to: articleImageView.bottomAnchor, 8)
        titleLabel.pinHorizontal(to: wrap, 16)
        
        descriptionLabel.pinTop(to: titleLabel.bottomAnchor, 4)
        descriptionLabel.pinHorizontal(to: wrap, 16)
        descriptionLabel.pinBottom(to: wrap, 8)
    }

    // MARK: - Configuration
    func configure(with article: ArticleModel) {
        articleImageView.showAnimatedGradientSkeleton()
        
        titleLabel.text = article.title
        descriptionLabel.text = article.announce
        
        articleImageView.kf.setImage(
            with: article.img?.url,
            options: [.cacheSerializer(FormatIndicatedCacheSerializer.png), .transition(.fade(0.3))]) { [weak self] result in
            switch result {
            case .success:
                self?.articleImageView.hideSkeleton()
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
