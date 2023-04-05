//
//  ViewController.swift
//  testURL
//
//  Created by 杜一鸣 on 2023/4/5.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var urlLabel: UILabel!
    // 模拟网络请求的过程
    let array = (1...10).map{ ("\($0)号url",Int.random(in: 1...10)) }
    let queue = OperationQueue()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func test(_ sender: Any) {
        for i in 0..<10 {
            let (name,duration) = self.array[i]
            // 可以自己继承opeartion实现cancel网络请求的功能
            let operation = BlockOperation { [weak self] in
                print("执行\(name)，\(Thread.current.description)")
                Thread.sleep(forTimeInterval: Double(duration))
                DispatchQueue.main.async {
                    if (self?.urlLabel.text?.count == 0) {
                        self?.urlLabel.text = name
                    }
                }
            }
            self.queue.addOperation(operation)
        }
        
    }
    
}

