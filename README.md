# 設計架構
>UI 主要都以 code layout 來製作。減少使用 storoboard、xib 來製作 UI ，避免未來難以維護的情況。
## 首頁
>以 tableView 為基底設計框架，以 cell 來製作各區塊的 UI (餘額顯示、button 區、ad 廣告...)
>使用以下 enum 來抓取對應的 cell
```swift
enum CathayHomeTab: Int, CaseIterable {
    case cashbalance = 0
    case favorite
    case ad
}
```
>方便未來擴增調整、以及區塊更動。

>下方 tabBar 以客製化 View 並結合 StackView 製作
>並以 enum 來取得 tap name & 區塊，方便日後需要調整擴增、及刪除。


### cashbalance (餘額顯示區)

TODO: loading UI

### favorite (按扭區)
上面按鈕區不確定業務需求，是要可以左右滑動 or 上下滑動？

或是可以擴增調整移動？

因此先使用 stackView 搭配 View 來新增製作 

TODO: 下拉更新後，抓取好友資料

### ad (廣告區)
控制輪播的功能，暫時做在 ad cell 裡面處理


TODO: Constraint Magical numbers