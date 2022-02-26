//
//  TodayViewController.swift
//  AppStoreApp
//
//  Created by HyeonSoo Kim on 2022/02/26.
//

import UIKit

class TodayViewController: UICollectionViewController {
    
    var todayList: [Today] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        //data Setting
        todayList = getTodayList()
        
        //register
        collectionView.register(
            TodayHeader.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "TodayHeader"
        )
        
        collectionView.register(
            TodayCollectionViewCell.self,
            forCellWithReuseIdentifier: "TodayCollectionViewCell"
        )
    }
    
    func getTodayList() -> [Today] {
        guard let path = Bundle.main.path(forResource: "Today", ofType: "plist"),
              let data = FileManager.default.contents(atPath: path),
              let list = try? PropertyListDecoder().decode([Today].self, from: data) else { return [] }
        return list
    }
    
    //collectionView 기본설정. 아래에 extension으로 delegate설정.
    private func configureCollectionView() {
        self.collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        self.collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}

extension TodayViewController {
    
    //MARK: - DataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.todayList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TodayCollectionViewCell", for: indexPath) as? TodayCollectionViewCell else { return UICollectionViewCell() }
        let url = URL(string: todayList[indexPath.row].imageURL)
        let data = try? Data(contentsOf: url!)
        cell.imageView.image = UIImage(data: data!)
        
        cell.layer.cornerRadius = 15.0
        cell.layer.borderWidth = 0.0
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 0)
        cell.layer.shadowRadius = 5.0
        cell.layer.shadowOpacity = 1
        cell.layer.masksToBounds = false
        
        return cell
    }
    
    //headerView Setting
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TodayHeader", for: indexPath) as? TodayHeader else { fatalError("Couldn't dequeue Header") }
            
            headerView.dateLabel.text = "22년 2월 26일"
            headerView.titleLabel.text = "투데이"
            return headerView
        } else {
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width: CGFloat = (UIScreen.main.bounds.width) - 20
        return CGSize(width: width, height: 80)
    }
}

extension TodayViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width) - 20, height: (UIScreen.main.bounds.width) - 20)
    }
}
