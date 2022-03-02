//
//  TodayViewController.swift
//  AppStoreApp
//
//  Created by HyeonSoo Kim on 2022/02/26.
//

import UIKit
import Kingfisher

final class TodayViewController: UICollectionViewController {
    
    private var todayList: [Today] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        configureCollectionView()
    }
    
    //맨 아래 참고.
    private func getTodayList() -> [Today] {
        guard let path = Bundle.main.path(forResource: "Today", ofType: "plist"),
              let data = FileManager.default.contents(atPath: path),
              let list = try? PropertyListDecoder().decode([Today].self, from: data) else { return [] }
        return list
    }
    
    //collectionView 기본설정. 아래에 extension으로 delegate설정.
    private func configureCollectionView() {
        self.collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        self.collectionView.contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
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
        
        cell.imageView.kf.setImage(with: url!) //kingfisher사용하면 자동으로 비동기로 이미지가져오기에 잔렉 안걸림.
        
        cell.title.text = todayList[indexPath.item].title
        cell.subTitle.text = todayList[indexPath.item].subTitle
        cell.descrip.text = todayList[indexPath.row].description
        
        cell.layer.cornerRadius = 12.0
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
            
            headerView.dateLabel.text = "2월 28일 월요일"
            headerView.titleLabel.text = "투데이"
            return headerView
        } else {
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width: CGFloat = (UIScreen.main.bounds.width) - 32
        return CGSize(width: width, height: 100)
    }
}

extension TodayViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width) - 32, height: (UIScreen.main.bounds.width) - 32)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let value: CGFloat = 16 //swiftUI에서 padding()하는 거랑 유사한 역할인듯.

        return UIEdgeInsets(top: value, left: value, bottom: value, right: value)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailedVC = TodayDetailedViewController()
        
        let url = URL(string: todayList[indexPath.row].imageURL)
        
        detailedVC.imageView.kf.setImage(with: url!)
        detailedVC.titleLabel.text = todayList[indexPath.row].title
        detailedVC.descriptionLabel.text = todayList[indexPath.row].subTitle
        
        self.present(detailedVC, animated: true, completion: nil)
    }
}


//plist에서 데이터 가져오는 방법은 더 있음.
//위처럼 Path방식으로 가져올 수도 있고, 아래처럼 URL방식으로도 가능.
private extension TodayViewController {
    func fetchData() {
        guard let url = Bundle.main.url(forResource: "Today", withExtension: "plist") else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let list = try PropertyListDecoder().decode([Today].self, from: data)
            self.todayList = list
        } catch {}
    }
}
