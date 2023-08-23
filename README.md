# 設計架構
>UI 主要都以 code layout 來製作。減少使用 storoboard、xib 來製作 UI ，避免未來難以維護的情況。
## 首頁
>以 tableView 為基底設計框架，以 cell 來製作各區塊的 UI (餘額顯示、button 區、ad 廣告...)
>方便未來擴增調整、以及區塊更動。

>下方 tabBar 以客製化 View 並結合 StackView 製作
>並以 enum 來取得 tap name & 區塊，方便日後需要調整擴增、及刪除。


