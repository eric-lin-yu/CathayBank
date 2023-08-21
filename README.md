# 設計架構
>UI 主要都以 code layout 來製作，避免使用 storoboard、xib，未來難以維護的情況。
## 首頁
>以 tableView 為基底，搭配 cell 來製作各區塊的 UI (餘額顯示、button、ad...)，方便未來擴增、調整區塊

>下方 tabBar 則以客製化 View 並結合 StackView、以 enum 取得 tap，方便未來擴增、調整

