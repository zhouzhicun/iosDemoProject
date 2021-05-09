//
//  ListViewConstants.swift
//  demoProject
//
//  Created by zzc on 2021/4/12.
//

import Foundation

enum APListViewType: Int {
    case tableView          //列表
    case collectionView     //collectionView
}

enum APListViewSubType: Int {
    case normal         //普通列表
    case refresh        //下拉刷新
    case paged          //分页：下拉刷新+加载更多
}
