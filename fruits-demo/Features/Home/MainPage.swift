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
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let cellData = data[indexPath.row]
        cell.textLabel?.text = cellData.title
        cell.imageView?.image = UIImage(named: cellData.imageName)
        return cell
    }

    // UITableView Delegate method
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellData = data[indexPath.row]
        
        let detailVC = FruitDetailPage()
        detailVC.item = cellData // 传递水果数据
        navigationController?.pushViewController(detailVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }


    @objc private func startButtonTap() {
        // You can put other code here for a "start" action, like opening a different view.
        let homeViewController = FruitDetailPage()
        navigationController?.pushViewController(homeViewController, animated: true)
    }
}

