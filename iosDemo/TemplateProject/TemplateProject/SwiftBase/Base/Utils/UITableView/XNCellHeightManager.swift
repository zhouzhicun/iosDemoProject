//
//  UITableViewHeightCache.swift
//  MaxiBas_Platfrom
//
//  Created by zzc on 2020/8/17.
//  Copyright © 2020 autel. All rights reserved.
//


import Foundation
import UIKit


/**
cell高度自适应缓存，按照进行缓存
 */
class XNCellHeightManager<CellType: Hashable> {
    
    //固定高度表
    var fixHeightTable: [CellType: CGFloat] = [:]
    
    //缓存高度表
    var cacheHeightTable: [IndexPath: CGFloat] = [:]
    
    
    //tableView
    weak var tableView: UITableView?
    
    func config(_ table: UITableView) {
        self.tableView = table
    }
}


// MARK: 固定高度
extension XNCellHeightManager
{
    //注册固定高度
    func cacheHeight(cellKind: CellType, cellHeight: CGFloat) {
        fixHeightTable[cellKind] = cellHeight
    }
    
    //tableView(_ tableView: UITableView, heightForRowAt indexPath:
    func getHeight(cellKind: CellType) -> CGFloat {
        return fixHeightTable[cellKind] ?? UITableView.automaticDimension
    }
}

// MARK: 估算高度
extension XNCellHeightManager
{

    //tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath:
    func getEstimatedHeight(cacheKey: IndexPath) -> CGFloat {
        return cacheHeightTable[cacheKey] ?? 0
    }
    
    //tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath:
    func cacheEstimatedHeight(cell: UITableViewCell, cacheKey: IndexPath) {
        let height = cell.frame.height
        cacheHeightTable[cacheKey] = height
    }

    //直接清空缓存: 当数据源发生变化，新旧数据源无重复数据，reload直接清空缓存
    func invalidCache() {
        cacheHeightTable.removeAll()
    }
}




