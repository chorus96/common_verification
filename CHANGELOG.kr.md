# 변경 이력
이 프로젝트의 모든 주요 변경 사항은 이 파일에 기록됩니다.

형식은 [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)를 기반으로 하며,
이 프로젝트는 [시맨틱 버저닝](http://semver.org/spec/v2.0.0.html)을 따릅니다.


## 미출시

### 추가

### 변경

### 수정

## 0.2.5 - 2025-01-07

### 수정
- FuseSoC 코어 파일을 0.2.5로 업데이트.

## 0.2.4 - 2024-12-04

### 수정
- 소규모 Verilator 수정 ([#8](https://github.com/pulp-platform/common_verification/pull/8), [#9](https://github.com/pulp-platform/common_verification/pull/9))

## 0.2.3 - 2022-09-14

### 추가
- fusesoc 지원 추가 ([#4](https://github.com/pulp-platform/common_verification/pull/4))

### 수정
- `rand_id_queue`: XSIM 호환성을 위해 `empty` 메서드를 `is_empty`로 이름 변경. ([#4](https://github.com/pulp-platform/common_verification/pull/4))

## 0.2.2 - 2022-08-29

### 추가
- signal highlighter 추가
- stream watchdog 추가

## 0.2.1 - 2021-12-02

### 수정
- `clk_rst_gen`:
  - 홀수 클럭 주기 생성 오류 수정.
  - 리셋 사이클 수 오류 수정.


## v0.2.0 - 2019-08-20

### 추가
- 시뮬레이션 타임아웃 모듈 추가.

### 변경
- 모든 모듈에서 `timeunit` 및 `timeprecision` 선언 제거. 여러 시뮬레이터가 이 선언의 우선순위를
  올바르게 구현하지 않으므로(IEEE 1800-2012, 3.14.2.3), 시뮬레이션 전역 정밀도 선언 방식으로 변경.
- 스타일 가이드라인 준수를 위해 파라미터 이름 변경.


## v0.1.2 - 2019-08-20

### 수정
- rand_synch_driver: `rand_synch_holdable_driver` 인스턴스화 오류 수정.
- rand_stream_slv: `rand_sync_driver` 인스턴스화 오류 수정.


## v0.1.1 - 2019-02-26

### 수정
- 모든 파일을 `simulation` 타겟으로 이동. 이 패키지가 의존성으로 포함될 때 패키지 내 파일이
  합성되지 않도록 방지.


## v0.1.0 - 2019-02-25

### 추가
- 독립형 클럭 및 리셋 생성기 추가.
- 랜덤화 동기 드라이버 및 일시정지 가능 드라이버 추가.
- 랜덤화 스트림 마스터 및 슬레이브 추가.
- 랜덤화 출력을 가진 ID 큐 추가.
- 클럭 사이클의 무작위 수(지정 범위 내) 대기 태스크를 포함하는 `rand_verif_pkg` 추가.
