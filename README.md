# 設計架構
UI 主要都以 code layout 來製作，不使用 storoboard、xib 來製作 UI 

避免未來難以維護的情況。

專案以 MVVM 的架構來撰寫設計，並不使用第三方套件。


## 首頁
tableView 為基底設計框架，以 cell 來製作各區塊的 UI 

(餘額顯示、button 區、ad 廣告...)

使用以下 enum 來抓取對應的 cell

方便未來擴增調整、以及區塊更動。
```swift
enum CathayHomeTab: Int, CaseIterable {
    case cashbalance = 0
    case favorite
    case ad
}
```

下方 tabBar 以客製化 View 並結合 StackView 製作

### cashbalance (餘額顯示區)

TODO: loading UI 效果

### favorite (按扭區)
>上面按鈕區不確定業務需求，是要左右滑動 or 上下滑動？
或是可以擴增? 不能移動？\
因此先使用 stackView 搭配 View 來新增製作 

最愛的 icon 在 ziplin 上只有四張，且與 API 打過去得到的 nickname\
也無相關，因此先以目前有的四張來做使用

### ad (廣告區)



TODO: Constraint Magical numbers
