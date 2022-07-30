#!/bin/bash

tmp=/tmp/$$


ERROR () {
    #echo "$1" >&2
    cat $tmp-error
    rm -f $tmp-*
    exit 1
}

# テスト開始
echo "teat1-1: 正常系"
./kadai4.sh 5 10 > $tmp-result
echo "5" > $tmp-anser
diff $tmp-result $tmp-anser || echo "error in test1-1" >> $tmp-error

echo "teat1-2: 正常系"
./kadai4.sh 21 14 > $tmp-result
echo "7" > $tmp-anser
diff $tmp-result $tmp-anser || echo "error in test1-2" >> $tmp-error

echo "teat2-1: 異常系(引数なし)"
./kadai4.sh > $tmp-result
echo "Error!" > $tmp-anser
diff $tmp-result $tmp-anser || echo "error in test2-1" >> $tmp-error

echo "teat2-2: 異常系(引数一つ)"
./kadai4.sh 21 > $tmp-result
echo "Error!" > $tmp-anser
diff $tmp-result $tmp-anser || echo "error in test2-2" >> $tmp-error

echo "teat2-3: 異常系(引数がマイナスの値)"
./kadai4.sh -21 > $tmp-result
echo "Error!" > $tmp-anser
diff $tmp-result $tmp-anser || echo "error in test2-3" >> $tmp-error

echo "teat2-4: 異常系(引数がマイナスの値)"
./kadai4.sh 21 -1 > $tmp-result
echo "Error!" > $tmp-anser
diff $tmp-result $tmp-anser || echo "error in test2-4" >> $tmp-error

echo "teat2-5: 異常系(引数が文字列)"
./kadai4.sh "abc" > $tmp-result
echo "Error!" > $tmp-anser
diff $tmp-result $tmp-anser || echo "error in test2-5" >> $tmp-error

# テストでエラーがあった場合はエラー出力
if [ -f $tmp-error ]; then
    ERROR
fi

