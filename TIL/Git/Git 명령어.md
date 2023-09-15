# Git 명령어

## git 사용자이름, 사용자메일 설정 확인
```
git config --global user.name
git config --global user.email

git config --local user.name
git config --local user.email
```

## git 전역으로 사용자이름, 사용자메일 설정
```
git config --global user.name [name]
git config --global user.email [E-mail]
```

## git 사용자이름, 사용자메일 지역으로 설정
```
git config --local user.name [name]
git config --local user.email [E-mail]
```

## 서로 다른 저장소를 한곳에 병합
각각 다른 저장소에 있는 파일을 한쪽 저장소에 합치고 싶을 때 합치고 싶은 저장소로 복사 붙여넣기를 하면되지만 기존 저장소의 수정,로그 정보는 포기해야 한다. 로그 정보를 포함한 모든것을 옮기고 싶을 때 사용!
```
// storage2를 storage1 저장소에 옮기고 싶을 때
// storage1 저장소 폴더에서 명령어 시작!

$ git remote add storage2 storage2주소
$ git fetch storage2
$ git merge --allow-unrelated-histories storage2/main # 또는 브렌치 이름
$ git remote remove storage2
$ git commit -m "Merge storage2 into storage1"
$ git push origin main

$ git push --mirror
```

## branch
- 프로젝트를 여러가지 버전으로 관리해야할 때
- 여러 작업이나 기능이 각각 독립되어 진행될 때 사용
```
$ git branch // 현재 내 저장소에 어떤 브랜치들이 있는지 확인
$ git branch 브랜치명     // 브랜치 생성
$ git checkout 브랜치명     // 브랜치 이동
$ git push origin 브랜치명// ⭐️ 브랜치 커밋할때 주의!
$ git merge 브랜치명 // ⭐️적용받을 브랜치로 이동 후 작업
$ git branch -d 브랜치명 // 로컬저장소 브랜치 삭제 (병합이 완료된것만)
$ git push origin --delete 브랜치명 // 원격저장소 브랜치 삭제
```

## git reset
```
$ git reset --hard //마지막 commit 전으로 롤백
$ git reset --hard 커밋해쉬코드 //특정 commit 지점으로 롤백
$ git reset HEAD^  //commit을 취소하고 unstaged 상태로 변경
$ git reset —soft HEAD^ //commit을 취소하고 staged 상태로 변경
```

## git rm
- Local에 폴더나 파일을 삭제 및 이동을 하고 push를 할 시 GitHub는 그대로 유지됨 
- local에서 삭제 한다고 remote에서 삭제가 이루어지지 않는다.
```
$git rm <fileName> // 원격 저장소와 로컬 저장소에 있는 파일 삭제
$git rm —cached <fileName> // 원격저장소에 있는 파일만 삭제
$git rm <file> // 하나씩 제거
$git add -u // 전부제거
그 다음 commit과 push를 하면 된다.
```
cached 옵션은 작업시에만 쓰는 파일이나 로그는 작업할 때 필요하지만 저장소에는 올리지 않아될 때 주로 사용한다.


## git status
- git에 의해 관리되는 파일들의 상태를 확인 할 수 있음
- 크게 두가지 Untracked, Tracked 상태가 있음
- Tracked 상태는 git add 명령어를 통해 파일이 추적되고 있는 상태임
- Tracked에서도 Unmodified, Modified, Staged 3개의 상태가 있음
- Staged : git add 명령어로 Staging Area에 파일이 있는 상태
- Unmodified : Staging Area에 있는 파일들을 커밋하게 되면Unmodified가 됨
- Modified : Unmodified 상태의 파일들을 수정하게되면 Modified가 됨

## .gitignore
- .gitignore 파일은 git 으로 버전 관리를 할때, 관리에서 제외할 파일 목록을 지정하는 것
- 개인정보가 들어간 파일을 제외하고 원격 저장소에 올리거나 협업시 충돌이 날 위험이 있는 파일을 제외하는데 유용함.

## git reset
- 특정 커밋까지 이력을 초기화
- 바로 전, 또는 n번 전까지 작업했던 내용을 취소할 수 있음
- 이력이 지워지기 때문에 주의해야 함
- reset은 기록이 남지 않기 때문에 commit 상태에서 지워지지만 로컬저장소에서는 임의로 지워줘야하고 지운 후에 commit 을 push 하게 되면 서로 파일이 다르기 때문에 push 가 되지 않음. 따라서 push --force 로 올려줘야함.
- 되도록 사용하지 않는 것이 좋음
```
git reset --hard HEAD^    바로 이전 커밋으로 돌아감
git reset --hard HEAD    ~n 최근부터 n만큼 커밋으로 돌아감
git push -f origin main    그 뒤 Remote repository 강제 푸쉬
```

## git revert
- 특정 커밋을 취소하는 새로운 커밋을 만듬
- 다시 되돌린 파일이라고 흔적이 남게되서 협업할때 좋음

## git rebase
  
## 언제 reset을 사용하고 언제 revert를 사용하는가
- reset: 현재 push하지 않은 상태에서 이전의 commit으로 되돌리기 위해 사용(이전 commit은 기록이 남지않음)
- revert: push유무와 상관없이 이전 commit으로 되돌리기 위해 사용(되돌린다 해도 commit 기록이 남음)

## 명령어에 따른 상태
![git1](https://github.com/ChanHyuc/StudySwift/assets/121753386/0a696e53-6419-474e-94eb-6f9ba48c0324)
![git2](https://github.com/ChanHyuc/StudySwift/assets/121753386/3181e052-388e-4492-b3be-dbe9722e10ac)

- Tracked상태와(추적되고 있는 파일)에는 Unmodified, Modified, Staged 3가지 상태가 존재하며 git add 명령어로 인해 추적되고 있는 파일들이다.
- Unmodified상태는 처음 레포지토리를 clone했을때의 비어있는 상태로이다.
branch는 독립적으로 어떤 작업을 진행하기 위한 개념이다. 각각의 브랜치는 서로 독립적이기 떄문에 영향을 주지않고 작업할 수 있다는 특징이 있다.
- revert는 새로운 커밋을 추가하면서 커밋을 되돌린다.
- reset은 이전 커밋으로 돌아간다는 점에서는 revert와 동일하지만 커밋을 추가하면서 되돌리는 것이 아닌 아예 그 커밋으로 돌아간다는 점에서 차이가 있다.

