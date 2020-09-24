# Acc!DEN-tv

Accidentv

## 개발 환경
- Git-repository: [https://github.com/rrstard/accidentv](https://github.com/rrstard/accidentv)
- Firebase Console: [https://console.firebase.google.com/project/acciden-tv](https://console.firebase.google.com/project/acciden-tv)
- Master Design: [https://www.figma.com/file/IwEO6dN7vf0RIE1iyxrqhK/STARD_Storyboard?node-id=73%3A2](https://www.figma.com/file/IwEO6dN7vf0RIE1iyxrqhK/STARD_Storyboard?node-id=73%3A2)

## Policy of git-branch 
- 브랜치 이름
1. develop - 개발 메인
1. master - 제품 release
1. 개별 브랜치 - $nickname/develop 이 기본
  - example
```
  ssk/develop - ssk 의 메인 개발
  ssk/feature/sign-in-page - ssk 의 로그인 페이지 작업
  ssk/feature/map-page - ssk 의 지도 페이지 작업
```

- PullRequest / Merge 방법
1. PR 생성자
  - develop 는 공용 브랜치이므로, 작업물을 반영하고 싶으면, $nick/feature/xxx 로 브랜치 올리고 develop을 대상으로 PullRequest 를 생성합니다.
1. 나머지 멤버
  - 코드리뷰: 작업물에 대한 피드백
  - accept가 과반을 넘기면 merge 가능, 부정적 피드백 존재시 merge 불가
  - 실제 merge 담당: ssk

## 개발 정보
### API
- 공사 [http://openapi.its.go.kr/portal/dev/dev4.do](http://openapi.its.go.kr/portal/dev/dev4.do)
- 사고 [http://openapi.its.go.kr/portal/dev/dev5.do](http://openapi.its.go.kr/portal/dev/dev5.do)
- CCTV [http://openapi.its.go.kr/portal/dev/dev6.do](http://openapi.its.go.kr/portal/dev/dev6.do)
