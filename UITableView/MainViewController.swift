//
//  MainViewController.swift
//  UITableView
//
//  Created by 倉田　隆成 on 2018/05/25.
//  Copyright © 2018年 倉田　隆成. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var pageTitle: NSArray!
    private var myTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "MainView"
        
        //TableViewの作成
        pageTitle = ["タイトルA","タイトルB","タイトルC"]
        
        myTableView = UITableView(frame: CGRect(x: 0,
                                                y: 0,
                                                width: self.view.frame.width,
                                                height: self.view.frame.height))
        myTableView.backgroundColor = UIColor.yellow
        //cell名の登録を行う
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        //Datasource,delegateを設定する
        myTableView.dataSource = self 
        myTableView.delegate = self
        self.view.addSubview(myTableView)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //選択肢状態のクリア
        if let indexPathForSelectedRow = myTableView.indexPathForSelectedRow{
            myTableView.deselectRow(at: indexPathForSelectedRow, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("index: \(indexPath.row) , value: \(pageTitle[indexPath.row])")
        
        var second:UIViewController!
        switch indexPath.row {
        case 0:
            second = AAAViewController()
        case 1:
            second = BBBViewController()
        case 2:
            second = CCCViewController()
        default:
            print("繊維先が設定されていません")
        }
        
        self.navigationController?.pushViewController(second, animated: true)
    }
    
    //Cellの総数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return pageTitle.count
    }
    
    //Cellに値を設定する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //cellの再利用設定
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(pageTitle[indexPath.row])"
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
