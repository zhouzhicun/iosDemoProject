//
//  TableViewAdapter.swift
//  MaxiAp200_Battery
//
//  Created by zzc on 2020/8/8.
//  Copyright © 2020 autel. All rights reserved.
//

import Foundation
import UIKit

/**
 cell注册
 */
class XNCellManager<KeyType: Hashable> {
    
    //cell表
    var cellDic: [KeyType: Any] = [:]
    
    //静态cell表
    var staticCellDic: [String: Any] = [:]
    
    //tableView
    weak var tableView: UITableView!
    
    init(_ table: UITableView) {
        self.tableView = table
    }
}

// MARK: 注册cell
extension XNCellManager {

    //注册cell
    func registerCell<T: UITableViewCell>(cellKind: KeyType,  cellCls: T.Type) {
        cellDic[cellKind] = cellCls
        tableView.register(cellWithClass: cellCls)
    }
    
    //deque cell
    func dequeCell(cellKind: KeyType, indexPath: IndexPath) -> UITableViewCell {
        guard let cellCls = cellDic[cellKind] else { fatalError() }
        return tableView.dequeueReusableCell(withIdentifier: String(describing: cellCls), for: indexPath)
    }
}

// MARK: 静态cell
extension XNCellManager {
    
    //静态cell
    func registerStaticCell<T: UITableViewCell>(cellKind: String,  cellInst: T) {
        staticCellDic[cellKind] = cellInst
    }
    
    //返回静态cell
    func dequeStaticCell(cellKind: String) -> UITableViewCell {
        guard let cell = staticCellDic[cellKind] as? UITableViewCell else { fatalError() }
        return cell
    }

}
