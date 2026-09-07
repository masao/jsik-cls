# jsik.cls

`jsik.cls` は、『情報知識学会誌』投稿用論文を pLaTeX / upLaTeX で作成するための LaTeX クラスファイルです。

既存の `jarticle` ベースの論文スタイルとの互換性をできるだけ維持しつつ、現在の日本語 LaTeX 環境でも利用できるようにしています。

主な特徴は以下のとおりです。

* pLaTeX / upLaTeX を自動判定
* pLaTeX では `jarticle`、upLaTeX では `ujarticle` を自動的に利用
* 本文サイズは 11pt 固定
* 2段組レイアウト
* `dvipdfmx` を標準の画像ドライバとして使用
* `dvips` もオプションで利用可能
* `balance` パッケージによる最終ページの段組均等化
* 日本語・英語のタイトル、著者名、抄録、キーワードに対応

なお、このスタイルファイルは非公式のものであり、実際の作成にあたっては編集委員会や学会からの指示に従っていただきますようお願いします。

また、スタイルファイルに問題や疑問がある場合はGithub上で報告ください。
不具合等を学会事務局や学会編集委員会へ連絡することのないようにお願いします。

## 必要な環境

以下のいずれかの日本語 LaTeX 環境を想定しています。

* pLaTeX
* upLaTeX

PDF の生成には、標準では `dvipdfmx` を利用します。

主に以下のパッケージを使用します。

* `graphicx`
* `url`
* `balance`

これらがあらかじめインストールされている必要があります。

## 基本的な使い方

`jsik.cls` （および `jsik.bst`）を LaTeX ソースと同じディレクトリに置き、メインの `.tex` ファイルで次のように指定します。

```latex
\documentclass{jsik}
```

基本的な例は以下のとおりです。

```latex
\documentclass{jsik}

\articletype{研究論文}

\jtitle{日本語タイトル}
\etitle{English Title}

\jauthor{著者 太郎}
\eauthor{Taro Author}

\affiliation{○○大学 ○○学部}

\jabstract{%
ここに日本語抄録を記述します。
}

\eabstract{%
This is an English abstract.
}

\jkeywords{情報検索，デジタルライブラリ}
\ekeywords{Information Retrieval, Digital Libraries}

\begin{document}

\maketitle

\section{はじめに}

本文を記述します。

\end{document}
```

## コンパイル方法

### pLaTeX を使用する場合

```bash
platex -kanji=utf8 paper.tex
dvipdfmx paper.dvi
```

### upLaTeX を使用する場合

```bash
uplatex -kanji=utf8 paper.tex
dvipdfmx paper.dvi
```

`jsik.cls` は実行中のエンジンを自動判定します。

* pLaTeX の場合は `jarticle`
* upLaTeX の場合は `ujarticle`

を基底クラスとして読み込みます。

そのため、通常はメインファイル側で `platex` や `uplatex` をクラスオプションとして指定する必要はありません。

## 文字コード

新規に作成する `.tex`、`.bib`、`.cls` 等のファイルは、UTF-8 で保存することを推奨します。

pLaTeX / upLaTeX で UTF-8 のソースを処理する場合は、必要に応じて次のように明示してください。

```bash
platex -kanji=utf8 paper.tex
```

または、

```bash
uplatex -kanji=utf8 paper.tex
```

既存の Shift_JIS や EUC-JP の原稿については、使用する TeX 環境の設定に依存します。

## クラスオプション

### `dvipdfmx`

`dvipdfmx` を画像ドライバとして利用します。

```latex
\documentclass[dvipdfmx]{jsik}
```

ただし、`dvipdfmx` は標準設定なので、通常は省略できます。

```latex
\documentclass{jsik}
```

で同じ設定になります。

### `dvips`

`dvips` を利用する場合に指定します。

```latex
\documentclass[dvips]{jsik}
```

古い EPS ベースのワークフローを利用する場合などを想定しています。

### `balance`

最終ページの左右の段の長さをできるだけ均等にします。

```latex
\documentclass[balance]{jsik}
```

この設定は標準設定なので、通常は省略できます。

```latex
\documentclass{jsik}
```

で同じ設定になります。

### `nobalance`

段組均等化を無効にします。

```latex
\documentclass[nobalance]{jsik}
```

図表、脚注、参考文献等の配置によって `balance` の結果が不自然になる場合に利用してください。

### `10pt` / `12pt`

執筆要領に従って、本文の文字サイズは 11pt に固定しています。

そのため、

```latex
\documentclass[10pt]{jsik}
```

または、

```latex
\documentclass[12pt]{jsik}
```

と指定しても 11pt が使用され、警告が表示されます。

以下のように `11pt` を指定することはできますが、省略して構いません。

```latex
\documentclass[11pt]{jsik}
```

## タイトル情報

### 論文種別

```latex
\articletype{研究論文}
```

### 日本語タイトル

```latex
\jtitle{日本語タイトル}
```

### 英語タイトル

```latex
\etitle{English Title}
```

### 日本語著者名

```latex
\jauthor{著者 太郎}
```

### 英語著者名

```latex
\eauthor{Taro Author}
```

### 所属

```latex
\affiliation{○○大学 ○○学部}
```

所属の英語名称、住所、ORCiD、Emailなどの項目を記載する場合は、改行 ``\\`` で区切ってください。

```latex
\affiliation{○○大学 ○○学部\\
Department of YY, University of ZZ\\
〒123-4567 ○○県○○市○○町1-2\\
https://orcid.org/0000-00XX-XXXX-XXXX\\
E-mail: foobar@example.jp
}
```

また、複数の異なる所属情報を入れる場合は、それぞれの所属番号をつけて区別してください。
詳細は ``sample.tex`` のマークアップを確認ください。

### 日本語抄録

```latex
\jabstract{%
日本語抄録を記述します。
}
```

### 英語抄録

```latex
\eabstract{%
English abstract.
}
```

### 日本語キーワード

```latex
\jkeywords{情報検索，デジタルライブラリ}
```

### 英語キーワード

```latex
\ekeywords{Information Retrieval, Digital Libraries}
```

## 図の挿入

画像の挿入には `graphicx` パッケージを使用します。

```latex
\begin{figure}[tb]
  \centering
  \includegraphics[width=.8\linewidth]{figure01}
  \caption{図の例}
  \label{fig:example}
\end{figure}
```

画像ファイルの拡張子は、できるだけ省略することを推奨します。

```latex
\includegraphics{figure01}
```

標準の `dvipdfmx` 環境では、PDF、PNG、JPEG 等を利用できます。

古い `dvips` 環境を利用する場合は、EPS 形式の画像が必要になる場合があります。

画像ファイル名には、日本語や空白を使用せず、ASCII 文字のみを使用することを推奨します。

例:

```text
figure01.pdf
system-overview.pdf
result-graph.png
```

## 追加パッケージ

必要に応じて、メインの `.tex` ファイル側で追加パッケージを読み込むことができます。

```latex
\documentclass{jsik}

\usepackage{booktabs}
\usepackage{amsmath}
\usepackage{hyperref}
```

ただし、パッケージによっては pLaTeX / upLaTeX や `dvipdfmx` との組み合わせに注意が必要です。

特に `hyperref` を利用する場合は、一般に他のパッケージより後ろで読み込むことを推奨します。

## 参考文献

通常の LaTeX / BibTeX の方法を利用できます。
また、同じく非公式の書誌情報書式スタイル ``jsik.bst`` を同梱していますので、それを使っていただくのが便利と思います。

例:

```latex
\bibliographystyle{jsik}
\bibliography{references}
```

引用は、

```latex
\cite{sample2026}
```

のように記述します。

本クラスでは引用番号を上付き形式で表示するように設定しています。

## 段組の均等化

本クラスでは `balance` パッケージを標準で利用し、最終ページの左右の段の高さをできるだけ揃えます。

通常は特別な指定は不要です。

```latex
\documentclass{jsik}
```

また、途中に別スタイルのページが加わっている場合には、最終ページの左右の段組みがそろわない場合があります。
その場合は、本文の最終ページの箇所に、明示的に以下のようなコマンド指示を挿入してください。

```latex
\balance
```

なお、図表や脚注の配置などによって問題が生じる場合は、

```latex
\documentclass[nobalance]{jsik}
```

として無効化してください。


## 既存原稿との互換性

本クラスは、従来の pLaTeX + `jarticle` を前提とした原稿との互換性をできるだけ維持することを目的としています。

pLaTeX で処理した場合は、従来どおり `jarticle` を基底クラスとして使用します。

upLaTeX で処理した場合のみ、対応する `ujarticle` を自動的に利用します。

ただし、以下のような古い記法については、現在の LaTeX の標準的な記法への移行を推奨します。

古い記法:

```latex
{\bf 太字}
```

推奨する記法:

```latex
{\bfseries 太字}
```

図についても、古い `epsfig` や `epsf` ではなく、

```latex
\includegraphics
```

を利用してください。

## 注意事項

### LuaLaTeX について

現在の `jsik.cls` は pLaTeX / upLaTeX を対象としており、LuaLaTeX は正式な対応対象としていません。

LuaLaTeX での利用については、将来的に検討する可能性があります。

### ページレイアウト

本クラスでは、既存の論文スタイルとの互換性を維持するため、余白、本文領域、段間隔等をクラスファイル内で固定しています。

主な設定値は以下のとおりです。

| 項目      |   設定値 |
| ------- | ----: |
| 本文文字サイズ |  11pt |
| 本文幅     | 160mm |
| 本文高さ    | 237mm |
| 左右余白基準  |  25mm |
| 上端基準    |  35mm |
| 段間隔     |   2em |
| 段組      |    2段 |

これらの値をメイン文書側で変更すると、所定の誌面から外れる可能性があります。

### 抄録の文字サイズ

抄録、所属、キーワード等には、本文より小さい `\small` を使用しています。

11pt 文書における `\small` は、おおむね 10pt 相当です。

### 最終ページ

`balance` パッケージによる段組均等化は、図表、脚注、長い参考文献等がある場合に必ずしも理想的な結果になるとは限りません。

必要に応じて `nobalance` オプションを利用してください。

## 推奨環境

新規の原稿については、以下の組み合わせを推奨します。

```text
UTF-8
upLaTeX
dvipdfmx
```

コンパイル例:

```bash
uplatex -kanji=utf8 paper.tex
uplatex -kanji=utf8 paper.tex
dvipdfmx paper.dvi
```

従来環境との互換性が必要な場合は、

```text
pLaTeX
dvipdfmx
```

も利用できます。

## ライセンス

本スタイルファイルについては、MITライセンスによるオープンソースとします。

## 更新履歴

### Version 2.0

* pLaTeX / upLaTeX の自動判定に対応
* upLaTeX では `ujarticle` を利用
* 本文サイズを 11pt に統一
* `dvipdfmx` を標準画像ドライバとして採用
* `dvips` オプションを追加
* `balance` / `nobalance` オプションを追加
* 日本語・英語のキーワードを分離
* 日本語・英語抄録で複数段落を利用可能に変更
* `graphicx` による画像挿入を標準化
* 2026年7月の執筆要領改訂にあわせて ORCiD 記載の例を加えました。

## ファイル構成例

```text
.
├── jsik.cls
├── README.md
├── sample.tex
├── sample.pdf
├── references.bib
└── figures/
    └── figure01.pdf
```

## 不具合報告・問い合わせ

不具合報告や改善提案は、本リポジトリの Issues からお願いします。

報告時には、可能であれば以下の情報を含めてください。

* OS
* TeX Live 等のバージョン
* pLaTeX / upLaTeX のどちらを使用したか
* 実行したコマンド
* エラーメッセージ
* 問題を再現できる最小の LaTeX ソース
