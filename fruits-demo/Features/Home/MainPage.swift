//
//  ViewController.swift
//  fruits-demo
//
//  Created by hxy on 2024/11/13.
//

/*import UIKit
import SnapKit

struct CellData {
    let title: String
    let imageName: String
    let description: String // 添加多行描述属性
}

class MainPage: UIViewController {
    
    let startButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        
        startButton.setTitle("Start", for: .normal)
        startButton.setTitleColor(.black, for: .normal)
        view.addSubview(startButton)
        startButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        startButton.addTarget(self, action: #selector(startButtonTap), for: .touchUpInside)
    }

    @objc private func startButtonTap() {
        var vc = ApplePage()
        navigationController?.pushViewController(vc, animated: true)
    }
}
*/
import UIKit
import SnapKit

struct CellData {
    let title: String
    let imageName: String
    let description: String // 添加多行描述属性
}

class MainPage: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let tableView = UITableView()
    let data: [CellData] = [
        CellData(title: "Apple", imageName: "apple", description: "A juicy red apple that's very healthy."),
        CellData(title: "Banana", imageName: "banana", description: "A sweet yellow banana, great for snacks."),
        CellData(title: "Cherry", imageName: "cherry", description: "A bunch of red cherries, small and tasty."),
        CellData(title: "Pear", imageName: "pear", description: "A green pear with a soft and juicy texture."),
        CellData(title: "Blueberry", imageName: "blueberry", description: "Small blue berries packed with antioxidants."),
        CellData(title: "Peach", imageName: "peach", description: "A soft peach with a sweet and fuzzy exterior."),
        CellData(title: "Grape", imageName: "grape", description: "Bunches of purple grapes, great for snacking."),
        CellData(title: "Mango", imageName: "mango", description: "A tropical mango with a sweet, juicy flavor."),
        CellData(title: "Kiwi", imageName: "kiwi", description: "A small green fruit with a unique tart flavor."),
        CellData(title: "Lemon", imageName: "lemon", description: "A sour lemon perfect for adding flavor.")
    ]
    
    let startButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        // TableView setup
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-50)
            make.leading.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
/*        // Start button setup
        startButton.setTitle("Start", for: .normal)
        startButton.setTitleColor(.black, for: .normal)
        view.addSubview(startButton)
        startButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
        startButton.addTarget(self, action: #selector(startButtonTap), for: .touchUpInside)
 */
    }

    // UITableView DataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count//data.count 是数组 data 中元素的总数，有标签、图片、详细解释共三个元素
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let cellData = data[indexPath.row]
        cell.textLabel?.text = cellData.title//设置单元格（滚动列表）的内容，包括title和image
        cell.imageView?.image = UIImage(named: cellData.imageName)
        return cell
    }

    // UITableView Delegate method：处理用户在 UITableView 中选择某一行时触发的逻辑
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //indexPath: 表示被选中的行的位置。  row: 表示该行在段中的索引（从 0 开始计数）
        let cellData = data[indexPath.row]
        //data 是一个数组，存储了每一行的水果数据（CellData 类型）
        //indexPath.row 提供被点击行的索引，通过索引获取对应的水果数据并存储在 cellData 中
        let detailVC = FruitDetailPage()//创建并初始化详情页
        detailVC.item = cellData // 传递水果数据
        navigationController?.pushViewController(detailVC, animated: true)//当前表格页面导航到水果详情页面，用户可以看到水果的详细信息
        tableView.deselectRow(at: indexPath, animated: true)//取消被选中行的高亮状态，取消选中的过程会有一个淡出的动画效果
    }


    @objc private func startButtonTap() {
        // You can put other code here for a "start" action, like opening a different view.
        let homeViewController = FruitDetailPage()
        navigationController?.pushViewController(homeViewController, animated: true)
    }
}

