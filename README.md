# 概要

https://qiita.com/NorsteinBekkler/private/9e4d4050c4d033809afa にて書いた『Objective-Cで書いたCustomViewをStoryboardで指定するとunrecognized selector sent to instanceになる問題の解決方法』の再現用プロジェクトになります。

![](https://camo.qiitausercontent.com/b3979fce7262a01354fd2d4a367d94693f25f879/68747470733a2f2f71696974612d696d6167652d73746f72652e73332e616d617a6f6e6177732e636f6d2f302f35363137382f35633137353938622d363862652d616466372d336535612d3064326464623062323263632e706e67)

## 説明

### ブランチについて

- masterブランチ
  - Objective-Cで書かれたCustomViewのコード
  - 最新のコードはクラッシュが再現するものになっていて、一つ前は再現しないものになっています
- custom_swift_view
  - Objective-Cで書かれたCustomViewのSwift版
  - こちらは落ちない

### 試し方

**Inherit Module From Target**にチェックをON/OFFする

![](https://camo.qiitausercontent.com/6e563f1bf5d26aabfada37276b3fc70cfafa05c0/68747470733a2f2f71696974612d696d6167652d73746f72652e73332e616d617a6f6e6177732e636f6d2f302f35363137382f61346136393332622d366236312d353834392d303434352d6161663336633964616166332e706e67)
