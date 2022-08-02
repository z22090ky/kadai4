#!/bin/bash

tmp=/tmp/$$


ERROR () {
    #echo "$1" >&2
    cat $tmp-error
    rm -f $tmp-*
    exit 1
}

# テスト開始
echo "正常系1-1:引数が2つの自然数で第一引数の方が小さい場合"
./kadai4.sh 4 6 > $tmp-result
echo "2" > $tmp-anser
diff $tmp-result $tmp-anser || echo "正常系1-1　エラー" >> $tmp-error

echo "正常系1-2:引数が2つの自然数で第一引数の方が大きい場合"
./kadai4.sh 35 20 > $tmp-result
echo "5" > $tmp-anser
diff $tmp-result $tmp-anser || echo "正常系1-2　エラー" >> $tmp-error

echo "異常系2-1:引数なし"
./kadai4.sh > $tmp-result
echo "Error!" > $tmp-anser
diff $tmp-result $tmp-anser || echo "異常系2-1　エラー　引数がありません" >> $tmp-error

echo "異常系2-2:引数が１つのみ"
./kadai4.sh 21 > $tmp-result
echo "Error!" > $tmp-anser
diff $tmp-result $tmp-anser || echo "異常系2-2　エラー　引数が1つしかありません" >> $tmp-error

echo "異常系2-3:i引数が1つかつ引数がマイナスの値"
./kadai4.sh -21 > $tmp-result
echo "Error!" > $tmp-anser
diff $tmp-result $tmp-anser || echo "異常系2-3　エラー　引数にマイナスの値を指定しています" >> $tmp-error

echo "異常系2-4:引数が2つかつ引数がマイナスの値"
./kadai4.sh 21 -1 > $tmp-result
echo "Error!" > $tmp-anser
diff $tmp-result $tmp-anser || echo "異常系2-4　エラー　引数にマイナスの値を指定してます" >> $tmp-error

echo "異常系2-5: 引数が文字列"
./kadai4.sh "abc" > $tmp-result
echo "Error!" > $tmp-anser
diff $tmp-result $tmp-anser || echo "異常系2-5　エラー　引数に文字列が指定されています" >> $tmp-error

# テストでエラーがあった場合はエラー出力
if [ -f $tmp-error ]; then
    ERROR
fi

