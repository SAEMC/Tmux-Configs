# SAEMC Tmux Settings

### 준비 사항

- `sudo` 및 `git` 설치
  > Mac은 XCode/Homebrew가 이미 설치되어 있는 환경

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

---

### 사용 방법

#### 매핑된 커맨드는 `~/.tmux.conf` 파일 확인

#### 이외의 커맨드는 Tmux 기본 커맨드 (Tmux 기본 커맨드 참조)

<br/>

- `<Ctrl>` + `b` + [[`h` or `j` or `k` or `l`]]: 페인(Pane) 이동
- `<Ctrl>` + `b` + `r`: `~/.tmux.conf` 리로드 (Reload)
- `<Ctrl>` + `b` + `s`: 페인 수평 분할 (Split)
- `<Ctrl>` + `b` + `v`: 페인 수직 분할 (Vertical Split)
- `<Ctrl>` + `b` + `y`: 페인 싱크 타이핑 (Yank)
- `<Ctrl>` + `b` + [[`[` or `]`]]: 윈도우 이동
