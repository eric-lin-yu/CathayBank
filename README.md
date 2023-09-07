# CathayBank Taichung Demo

# 設計架構
- 專案為 MVVM 的架構。

- 未使用第三方套件。

- UI 主要都以 code layout 來製作，不使用 storoboard、xib。

>TODO:\
目前 Constraint 都是 Magical numbers

## 首頁 (ViewController)
tableView 為基底設計框架，以 cell 來製作各區塊的 UI\
(餘額顯示、button favorite 區、ad 廣告區)

使用以下 enum 來抓取對應的 cell\
方便未來擴增調整、以及區塊更動。
```swift
enum CathayHomeTab: Int, CaseIterable {
    case cashbalance = 0
    case favorite
    case ad
}
```

- tabBar 以客製化 createView 並結合 StackView 組合而成\
-> 目前每個 icon 都能點選，但都未實作點選功能、選取狀態的 UI 變化
```swift
private func createView(image: String, title: String, tapAction: Selector) -> UIView
```

- Notification (右上鈴鐺 button)\
-> 下拉更新後，會去抓 viewModel 並 addTarget 才能點選，同時替換為 紅點 Icon

### cashbalance Cell(餘額顯示區)
- 目前是否顯示金額 & 隱藏餘額顯示的 label 是用兩個 label 來達成效果

  美金為例
```swift
//顯示
private let usdSubTitleLabel: UILabel
//隱藏
private let usdSubHideTiteLabel: UILabel
```
TODO: loading Skeleton Screen 效果

### favorite Cell (按扭區)
- 上方 button 按鈕區
>TODO:\
上面按鈕區不確定業務需求，是要左右滑動 or 上下滑動？
或是可以擴增? 不能移動？\
因此先使用 stackView 搭配 View 來新增製作 

- Favorite 以 collectionView 來製作
>TODO:\
Favorite icon 在 ziplin 上只有四張，且與 API 打過去得到的 nickname\
也無相關，因此先以目前有的四張來做使用

### ad Cell (廣告區)
- 以 collectionView 製作，並搭配 Timer 達到自動輪播的效果。
>TODO:\
目前 Timer 沒有停止的機制
