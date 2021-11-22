# FOOTBALL PJT 개요

나만의 팀을 구성하여 같은 지역의 팀들과 매칭 할 수 있는 사이트를 제작하였습니다.  
원하는 날짜와 시간에 팀들과 매칭하여 경기하고 경기 후 스코어 입력을 통해 전적관리와 랭킹 시스템을 제공합니다.  
풋살을 좋아하는 사람이라면 팀 활동과 용병 활동을 통해 언제든지 풋살경기를 즐길수 있습니다.


# 기능 리스트 업

### 멤버
- 회원가입, 로그인, 회원 수정, 회원 탈퇴, 멤버 블랙리스트, 내가 작성한 글 보기, 내가 신청한 글 보기
### 매치
- 매치 작성/수정/삭제/조회, 매치 신청/수락/거절/조회(문자 발송), 매치 결과 입력, 전적/승률 자동계산
### 용병
- 용병 작성/수정/삭제/조회, 용병 신청/수락/거절/조회(문자 발송)
### 팀
- 팀 생성/수정/삭제/조회, 팀 신청/거절/수락/조회, 팀원 방출, 매치 일정 관리/전적 조회
### 게시판
- 게시글 작성/수정/삭제/조회, 첨부파일 업로드/다운로드, 댓글 작성/수정/삭제/조회

# 데이터베이스 ERD
![Futsal_DB](https://user-images.githubusercontent.com/89242534/142819106-28d828c3-1a4f-4f03-9179-7852c00c1bd9.png)

# 개발 환경
- Java v11.0.11
- Tomcat v8.5
- Oracle v11.2.0
- Spring 5.0.7


# 소스 설명
### 1. 문자 서비스(CoolSMS) SDK
- 문자 발송을 위해 CoolSMS SDK를 pom.xml에 추가 해야 함.
- [CoolSMS 사이트](https://developer.coolsms.co.kr/developer)
```
<dependency>
	<groupId>net.nurigo</groupId>
	<artifactId>javaSDK</artifactId>
	<version>2.2</version>
</dependency> 
```


# 프로젝트 동영상 & PPT
- [YouTube](https://youtu.be/-7R-0i-TMWA)
- [구글 드라이브 - 다운로드](https://drive.google.com/drive/folders/1f2RWy38Cho7GFt9QEAd32QW9p9VfRCsK?usp=sharing)


# 프로젝트 팀원
1. 윤인규 / storyik@naver.com
2. 송영준 / tungjun112702@gmail.com
3. 김승수 / sy2003m@naver.com
4. 박성환 / suremind33@gmail.com


