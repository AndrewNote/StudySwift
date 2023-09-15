# Git
- Git은 Local에서 돌아가는 버전관리 프로그램.
- GitHub는 Remote에서 이 버전들을 저장해놓은 저장소.
- 본인컴퓨터가 Local이고 본인외(다른컴퓨터, 원격저장소)를 Remote라고 한다.
- 오픈 소스 버전 관리 시스템(VCS: Version Control System)

## GitHub
- Git Repository를 위한 웹 기반 호스팅 서비스
- 클라우드 서버를 사용해서 로컬에서 버전 관리한 소스코드를 업로드하여 공유 가능
- 분산 버전 제어, 액세스 제어, 소스 코드 관리, 버그 추적, 기능 요청 및 작업 관리를 제공

## Git 저장위치
### Staging Area
- git이 변경이력을 관리하는 부분
- Working Directory에서 git 명령어를 통해서 추가 가능
- 이 곳에 올라와 있는 파일만 저장소에 추가 및 수정 가능
- 일종의 준비구역

### Repository
- 변경이력을 저장한 저장소

### Local Repository
- 외부에 위치하지 않고 작업하고 있는 컴퓨터에 존재
- 인터넷을 이용하지 않기 때문에 매우 빠른 속도
- 인터넷이 연결되지 않아도 작업이 가능
- 잦은 저장소 처리요청에도 부담이 없음
- 외부 저장소에 손실이 발생하더라도 빠르게 복구 가능

### Remote Repository
- 전통적인 관점에서의 저장소의 개념
- 외부 서버에 위치하여 변경 이력을 기록하는 부분
- 인터넷을 이용하여 접근 가능
- 다중 사용자로부터 관리되는 각 로컬 저장소의 접점

## Local(내 컴퓨터)과 Remote(원격저장소)를 연결하는 두가지방법 
### git remote add origin repository주소
1. Local에 저장소 폴더를 만들고 git init으로 .git을 만든다.
2. GitHub에서 repository를 만든다.
3. git remote 명령어로 repository와 내 Local folder를 연결한다.

### git clone repository주소
1. repository를 만들고 주소를 clone 한다.
2. clone할 폴더를 만들고 git clone 명령어로 local에 repository를 만든다.
3. git clone은 git init으로 저장소를 만들지 않아도 .git이 생긴다.
