

# 프로젝트명

Project 42 - 42 서울 이노베이션 아카데미 1, 2층 유튜브 스튜디오 WEB(웹) 예약 시스템



## 프로젝트 소개

42 서울 이노베이션 아카데미 새롬관 1층과 2층에 각각 하나씩 있는 유튜브 스튜디오를 미리 예약하고 사용할 수 있게 해주는 웹 페이지입니다.

언어는 HTML, CSS, JavaScript 그리고 Java Eclipse를 사용하였습니다.  프레임워크는 Spring, 서버는 Tomcat으로 구성했습니다.

홈에서는 Studio1, 2에 대한 정보를 조회할 수 있습니다.

예약하기 창에서는 내가 원하는 시간대에 비회원으로 정보를 등록하여 예약할 수 있습니다.

취소하기 창에서는 내가 입력한 정보를 넣어 예약취소할 수 있습니다.

https://www.edwith.org/boostcourse-web/lecture/16680/

## 설치방법 및 개발환경설정

> 기본환경설정



1. JDK(Java SE Development Kit)를 다운받아줍니다.
   참고 : https://www.edwith.org/boostcourse-web/lecture/16680/
   
2. Eclipse 홈페이지에서 'Eclipse IDE for Enterprise Java Developers (includes Incubating components)'를 다운받습니다.

3.  환경설정을 해줍니다.
   윈도우 : https://newehblog.tistory.com/2
   리눅스 : https://amamongm.tistory.com/9
   맥 OS : https://m.blog.naver.com/PostView.nhn?blogId=cksdud9024&logNo=221235147362&proxyReferer=https:%2F%2Fwww.google.com%2F
   
4. Tomcat을 다운받아줍니다.(ver 8 정도)
   참고 : https://www.edwith.org/boostcourse-web/lecture/16684/
   
5. Mysql을 다운받습니다. 
   https://www.edwith.org/boostcourse-web/lecture/16717/

> 공통설정

6. 프로젝트 안에 있는 pom.xml을 수정합니다.  (여기서부턴 깃 클론이 되어있다는 가정)
   -> \<mysql\> 태그의 버전을 자신의 mysql version과 맞춥니다.
   -> mysql 버전은 cmd 창에서 mysql -V 를 입력해 알아낼 수 있습니다.
   
7. Mysql 계정을 생성합니다.

- 루트계정접속
  - mysql -uroot -p
- 데이터베이스 생성
  - CREATE DATABASE db명 
- 데이터베이스가 잘 생성됐는지 확인
  - SHOW databases
- 계정 생성하기
  - CREATE USER '유저아이디'@'%'(%대신 localhost도 가능) identified by '비밀번호'

- 권한 넘겨주기

  - GRANT ALL PRIVILEGES ON (생성한)DB명.* TO '(생성한)유저아이디'@'%'(%대신 localhost 가능)
  - 계정의 비번을 변경하고 싶을 경우 윗줄의 코드 뒤에 'IDENTIFIED BY 비밀번호'를 적어주면 됨.

- 부여된 권한 확인

  - SHOW GRANTS FOR 유저아이디@'권한(ex - '%')'

  * 참고 - 권한 제거 : REVOKE ALL ON DB명(.TABLE명) FROM 유저아이디
  * 참고 - 사용자 계정 삭제 : drop 유저아이디@권한
  * 참고 - DB삭제 : drop database db명

8. ddl, dml 입력(테이블 및 내용 생성)
   * cmd 또는 터미널에서 깃 클론한 폴더로 이동 (ddl_youtube_studio.ddl 파일이 있는 곳)
     * MYSQL -uroot (생성한)DB명 -p < ddl_youtube_studio.sql 입력
     * MYSQL -uroot (생성한)DB명 -p < dml_youtube_studio.sql 입력
     
9. 이클립스 프로젝트 내에서 src - main - resources - application.properties에서 다음을 수정
   * spring.datasource.username=생성한 계정명 (스페이스 없어야 함)
   * spring.datasource.password=해당계정 비밀번호(스페이스 없어야 함)
   * spring.datasource.url=jdbc:mysql://localhost:3306/ft_youtube~ 에서 ft_youtube 부분을 생성한 db명으로.
   
10. Java Resources - src/main/java - kr.or.connect.ftYoutube.config 패키지 내에 있는 DBConfig를 수정합니다.
    * 해당 클래스 내의 String username과 password를 생성한 정보에 따라 수정합니다.
    * 해당 클래스 내의 url에서 "jdbc:mysql://localhost:3306/ft_youtube?~" ft_youtube 부분을 생성한 db명으로 수정합니다.



## 사용예제

다음 링크에서 확인하세요 : )

https://youtu.be/hOrDHn94XXI



## 기여방법

아래 정보에 나와 있는 연락처로 메시지/메일 주세요!

혼자보단 같이 개발하고 싶어요!



## 작성자 정보

intra ID : kchoi

이름 : 최강훈

번호 : 010-5464-9342

Email me : rkdgns4562@naver.com


### Note

현재 다음 주소로 임시 서버를 열어두었습니다.
임시서버라 느리고 제가 노트북을 켰을 때만 접속이 가능합니다. ㅠ
http://78c7e74d.ngrok.io/ftYoutube

