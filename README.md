### &#128276; Note

현재 다음 주소로 임시 서버를 열어두었습니다.
임시서버라 느리고 제가 노트북을 켰을 때만 접속이 가능합니다. ㅠ
http://e32f4a28.jp.ngrok.io/ftYoutube

# 프로젝트명

Project 42 - 42 서울 이노베이션 아카데미 1, 2층 유튜브 스튜디오 WEB(웹) 예약 시스템

## &#128515; 개발동기

한번도 제대로 된 프로젝트를 한 적이 없었지만,   
42에 참가하게 된 동기 자체가 프로젝트를 많이 해보기 위해서였던 만큼   
프로젝트를 시도하고 완성시켜보고 싶었습니다..   
현실적이고 완성가능한 것을 하자는 생각을 갖고 어떤 프로젝트를 할지 고민하다보니   
클러스터 내의 유튜브 스튜디오를 예약하여 사용할 수 있게 해보는 것이 매우 부합한다는 생각이 들어 도전하게 됐습니다.   

## &#128588; 프로젝트 소개

42 서울 이노베이션 아카데미 새롬관 1층과 2층에 각각 하나씩 있는 유튜브 스튜디오를 미리 예약하고 사용할 수 있게 해주는 웹 페이지입니다.

언어는 HTML, CSS, JavaScript 그리고 Java Eclipse를 사용하였습니다.  
프레임워크는 Spring, 서버는 Apache Tomcat으로 구성했습니다.
DataBase는 MYSQL을 사용하였습니다.

홈에서는 Studio1, 2에 대한 정보를 조회할 수 있습니다.

예약하기 창에서는 내가 원하는 시간대에 비회원으로 정보를 등록하여 예약할 수 있습니다.

취소하기 창에서는 내가 입력한 정보를 넣어 예약취소할 수 있습니다.

&#10010; more)

1. 홈, 예약, 취소 페이지에서 42 이미지를 클릭하면 메인화면으로 돌아가 studio1 정보를 나타냅니다.
2. 매일 00시에 내일의 정보가 오늘의 정보로 넘어갑니다.
예를 들어 5월 8일 밤 11시 59분에서 5월 9일 새벽 00시 00분이 될 때,   
홈화면에서는 5월 9일이 'today'가 되어 원래 5월 9일(두 번째 열)에 있었던 정보들이 첫 번째 열로 넘어갑니다.   
그러면서 자연스럽게 마지막 날짜(마지막 열)는 모두 null처리 됩니다.   
여기서는 Spring의 Scheduler를 이용하였습니다.   
3. 예약, 취소 페이지에서 ID와 비밀번호 그리고 날짜와 시간은 null이 들어가지 않도록 방지했습니다.
4. 예약페이지에서는 이미 예약된 공간을 다시 예약하지 못하도록 방지했습니다.
5. 취소페이지에서는 입력한 예약 정보와 정확히 일치하는 정보를 입력해야만 취소되도록 했습니다.
6. 비밀번호는 SHA256 hashing을 통하여 서버 운영자도 비밀번호를 추측할 수 없도록 만들었습니다.   
SHA256처리는 Javascript로 처리하여 서버로 넘어오기 전에 암호화됩니다.
7. 세션 관리법을 배워 로그인 기능을 처리하려고 공부중입니다.   
나아가 intra 로그인만으로도 예약 및 취소가 가능할 수 있게 하는 것이 최종 목표입니다.

## &#128229; 설치방법 및 개발환경설정

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
   



## &#128269; 사용예제

다음 링크에서 확인하세요 : )

https://www.youtube.com/watch?v=DsO9Owd61q8



## &#128243; 기여방법

아래 정보에 나와 있는 연락처로 메시지/메일 주세요!

혼자보단 같이 개발하고 싶어요!



## &#128583; 작성자 정보

&#10095;	 intra ID : kchoi

&#10095;	 이름 : 최강훈

&#10095;	 번호 : 010-5464-9342

&#10095;	 Email me : rkdgns4562@naver.com





