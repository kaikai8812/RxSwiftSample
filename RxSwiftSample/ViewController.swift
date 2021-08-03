//
//  ViewController.swift
//  RxSwiftSample
//
//  Created by ヘパリン類似物質 on 2021/08/03.
//

import UIKit
import RxSwift
import RxCocoa



class ViewController: UIViewController {
    
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var Label: UILabel!
    
    private let count: BehaviorRelay<Int>  = BehaviorRelay(value: 0)  //イベントの発生や、イベントの検知を行うことができるクラス 、　反応をするような変数に対して、この型で規定する？ 値はvalueで与えている。
    private let disposeBag: DisposeBag = DisposeBag()  //メモリリークを回避するためのクラス
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
  
        
    }
    
    //Buttonを押したら、変数の値を変更する処理
    private func bindToButtonToValue() {
        button.rx.tap.subscribe(
            onNext: {[weak self] _ in self?.increment()}
        ).disposed(by: disposeBag)
    }
    
    private func increment() {
        count.accept(count.value + 1)
    }
    
    //変数の値が変化したら、変化後の値をビューに表示する
    
    private func bindCountTpText() {
        count.asObservable().subscribe( onNext: {
            [weak self] count in self?.Label.text = String(count)
        }).disposed(by: disposeBag)
    }
    
}

