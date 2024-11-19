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

class FruitDetailPage: UIViewController {//class FruitDetailPage：继承自 UIViewController，表示这是一个屏幕页面

    var item: CellData?//用于存储要显示的水果的详细信息，CellData 是一个包含水果数据的结构体
    
    private let titleLabel = UILabel()
    private let imageView = UIImageView()
    private let descriptionLabel = UILabel()
    
    let startButton = UIButton()

    override func viewDidLoad() {//viewDidLoad() 方法：页面加载后会被调用的方法，负责设置 UI 和逻辑
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Setup the labels to display title and description of the fruit
                titleLabel.text = item?.title
                descriptionLabel.text = item?.description
                
                view.addSubview(titleLabel)
                view.addSubview(descriptionLabel)
                view.addSubview(imageView)
        
        // imageview设置水果的图片：如果 item 有 imageName 属性，则加载对应的图片
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
        view.addSubview(startButton)//添加按钮到视图
        startButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)  // 10是与顶部的间距
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(10)  // 10是与左边的间距
        }
        startButton.addTarget(self, action: #selector(startButtonTap), for: .touchUpInside)//for: .touchUpInside:事件类型为按钮被按下且手指抬起时触发
        
    }
    //@objc private func startButtonTap()：返回按钮绑定了点击事件，当点击时，会调用该方法
    @objc private func startButtonTap() {
        //var vc = UIViewController()
        navigationController?.popViewController(animated: true)
        //navigationController 是 UIViewController的一个属性，表示当前视图控制器所在的导航控制器堆栈
        //popViewController(animated:)用于从导航控制器堆栈中移除当前视图控制器，并返回到堆栈中的上一个视图控制器
    }
}

