//
//  View2Controller.swift
//  fruits-demo
//
//  Created by hxy on 2024/11/14.
//

/*import UIKit
import SnapKit

class ApplePage: UIViewController {
    
    let startButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        
        startButton.setTitle("Back", for: .normal)
        startButton.setTitleColor(.black, for: .normal)
        view.addSubview(startButton)
        startButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        startButton.addTarget(self, action: #selector(startButtonTap), for: .touchUpInside)
    }

    @objc private func startButtonTap() {
        var vc = UIViewController()
        navigationController?.popViewController(animated: true)
    }
    
}
*/
import UIKit
import SnapKit

class FruitDetailPage: UIViewController {

    var item: CellData?
    
    private let titleLabel = UILabel()
    private let imageView = UIImageView()
    private let descriptionLabel = UILabel()
    
    let startButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Setup the labels to display title and description of the fruit
                titleLabel.text = item?.title
                descriptionLabel.text = item?.description
                
                view.addSubview(titleLabel)
                view.addSubview(descriptionLabel)
                view.addSubview(imageView)
        
        // 设置水果的图片
                if let imageName = item?.imageName {
                    imageView.image = UIImage(named: imageName)
                }
                imageView.contentMode = .scaleAspectFit
        
        
                titleLabel.snp.makeConstraints { make in
                    make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
                    make.centerX.equalToSuperview()
                }
                
                descriptionLabel.snp.makeConstraints { make in
                    make.top.equalTo(titleLabel.snp.bottom).offset(10)
                    make.centerX.equalToSuperview()
                    //make.leading.equalTo(view).offset(20)
                    //make.trailing.equalTo(view).offset(-20)
                    descriptionLabel.textColor = .gray
                }
        
               imageView.snp.makeConstraints { make in
                    make.top.equalTo(view.safeAreaLayoutGuide).offset(200) // 图片距离顶部 20
                    make.centerX.equalToSuperview() // 水平居中
                    make.height.equalTo(200) // 图片高度
                    make.width.equalTo(200) // 图片宽度
                }
        
        startButton.setTitle("Back", for: .normal)
        startButton.setTitleColor(UIColor(red: 0.5, green: 0.7, blue: 1.0, alpha: 1.0), for: .normal)
        view.addSubview(startButton)
        startButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)  // 10是与顶部的间距
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(10)  // 10是与左边的间距
        }
        startButton.addTarget(self, action: #selector(startButtonTap), for: .touchUpInside)
        
    }
    @objc private func startButtonTap() {
        var vc = UIViewController()
        navigationController?.popViewController(animated: true)
    }
}

