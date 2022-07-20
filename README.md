# SAEMC Tmux Settings

### 준비 사항

- `sudo` 및 `git` 설치
  > Mac은 XCode 및 Homebrew가 이미 설치되어 있는 환경

```bash
$ (sudo) apt-get update && \
  (sudo) apt-get install -y sudo git
```

- SAEMC Tmux-Settings 프로젝트 다운로드 및 실행
  > `$ ./tmux_settings.sh -a` -> Dependencies 설치 후 Scripts 작성  
  > `$ ./tmux_settings.sh -d` -> Dependencies만 설치  
  > `$ ./tmux_settings.sh -s` -> Scripts만 작성

```bash
$ git clone https://github.com/SAEMC/Tmux-Settings && \
  cd ./Tmux-Settings
$ ./tmux_settings.sh [OPTIONS]
```

- 설치 활성화

```bash
$ source ~/.bashrc (Linux인 경우)
$ source ~/.zshrc (Mac인 경우)
```

---

### 사용 방법

#### 기존 Prefix `<Ctrl>` + `b`에서 `<Ctrl>` + `<Space>`로 변경

#### 매핑된 커맨드는 `~/.tmux.conf` 파일 확인

#### 이외의 커맨드는 Tmux 기본 커맨드 (Tmux 기본 커맨드 참조)

<br/>

- `<Ctrl>` + `<Space>` + `<Option>` + [[`h` or `j` or `k` or `l`]]: 페인(Pane) 크기 조절 (`<Option>` 누른 상태에서 3초 내 반복(Repeat) 가능)
- `<Ctrl>` + `<Space>` + `<Option>` + `s`: 페인 수평 정렬 (Split)
- `<Ctrl>` + `<Space>` + `<Option>` + `v`: 페인 수직 정렬 (Vertical Split)
- `<Ctrl>` + `<Space>` + `<Space>`: Copy Mode 진입 (Vi 계열 커맨드 사용)
- `<Ctrl>` + `<Space>` + [[`h` or `j` or `k` or `l`]]: 페인 이동
- `<Ctrl>` + `<Space>` + `p`: 붙여넣기 (Paste)
- `<Ctrl>` + `<Space>` + `s`: 페인 수평 분할 (Split)
- `<Ctrl>` + `<Space>` + `u`: `~/.tmux.conf` 업데이트 (Update)
- `<Ctrl>` + `<Space>` + `v`: 페인 수직 분할 (Vertical Split)
- `<Ctrl>` + `<Space>` + `y`: Copy Mode에서 복사 (Yank)
- `<Ctrl>` + `<Space>` + [[`[` or `]`]]: 윈도우 이동
