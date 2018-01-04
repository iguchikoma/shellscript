#!/bin/bash
############################################################
# curlでbodyを変数に入れて使う方法
############################################################

VAR1='123'                # ヒアドキュメントで生成するbodyに入れる用の変数
VAR2='456'                # curlのURLに入れる用の変数

# POINT: JSONの一部に外部変数を使いながら、作った文字列をBODY変数に格納するためにヒアドキュメントを使う
BODY=$(cat <<EOS
{
  "ccc": "hoge${VAR1}",
  "eee" : {
    "fff": "ggg"
  }
}
EOS
)

# POINT: "${BODY}"という形で""で囲む ref: http://takuya-1st.hatenablog.jp/entry/2017/03/22/144700
curl -u username:password \
  -X POST \
  -H Accept:application/json \
  -H Content-Type:application/json \
  --data "${BODY}" http://localhost:12345/${VAR2}/bar

