BOBSH의 짧은 이야기 
=====

SK T타워 식당 메뉴를 Command line prompt에 나오도록 한다.
Prompt에 정보를 올린다는 것을 실험하기 위해서 만든 프로젝트이다.


사용법
=====

* python 라이브러리 추가
* install.sh 실행
* 아래 코드를 사용 중인 zsh 테마 설정에 추가한다.

``` 
function menu {
	[ -f ~/.oh-my-zsh/test/bob.sh ] && ~/.oh-my-zsh/test/bob.sh || "메뉴없음"
}
RPS1='${return_code} %D - %* $(menu)' 
```

* theme 설정 적용

```
> source [theme 설정 파일]
```

