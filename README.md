BOBSH의 짧은 이야기 
=====

SK T-타워 식당 메뉴를 Command line prompt에 나오도록 한다.

Prompt에 정보를 올린다는 것을 실험하기 위해서 만든 프로젝트이다.


사용법
=====

* Beautiful Soup Library  추가
	* Beautiful Soup Library 다운로드 링크[http://www.crummy.com/software/BeautifulSoup/]
	* 압축 해제 후 setup.py 실행으로 설치
* install.sh 실행
``` 
> chmod 755 install.sh 
> ./install.sh
```

* 아래 코드를 사용 중인 zsh 테마 설정에 추가한다.
``` 
function menu {
	[ -f ~/.bobsh/bob.sh ] && ~/.bobsh/bob.sh || "메뉴없음"
}
RPS1='${return_code} %D - %* $(menu)' 
```

	* 예제 파일 참조 [https://github.com/before30/bobsh/blob/master/example.zsh-theme]
	
* theme 설정 적용
```
> source [theme 설정 파일]
```

Oh-my-zsh 설치
====

1. https://github.com/robbyrussell/oh-my-zsh
2. http://whiteship.me/?p=13816
