# SAEMC's Tmux-Configs

## 1. 준비 사항

### 1-1. (권장) SAEMC's [iTerm2](https://github.com/SAEMC/iTerm2-Configs.git) 설정 적용

### 1-2. (Ubuntu만 해당) `sudo` 및 `git` 설치

> 최초 설치인 경우에만 다음 명령어 실행

```bash
apt-get update && apt-get install -y sudo git
```

### 1-3. SAEMC's Tmux-Configs 다운로드 및 실행

```bash
git clone https://github.com/SAEMC/Tmux-Configs && \
cd ./Tmux-Configs
```

> `$ ./tmux_configs.sh -a` -> 디펜던시 설치 후 스크립트 작성
>
> `$ ./tmux_configs.sh -d` -> 디펜던시만 설치
>
> `$ ./tmux_configs.sh -s` -> 스크립트만 작성 (디펜던시 설치 후)

```bash
./tmux_configs.sh [OPTIONS]
```

> (권장) 디펜던시 설치 후 스크립트 작성

```bash
./tmux_configs.sh -a
```

### 1-4. 디펜던시 설치 활성화

> Ubuntu인 경우

```bash
source ~/.bashrc
```

> Mac인 경우

```bash
source ~/.zshrc
```

<br/>

## 2. 사용 방법

### 2-1. 변경된 커맨드

#### 2-1-1. 기존 Prefix `<Ctrl>` + `b`에서 `<Ctrl>` + `<Space>`로 변경

#### 2-1-2. 매핑된 커맨드는 `~/.tmux.conf` 파일 확인

#### 2-1-3. 이외의 커맨드는 Tmux 기본 커맨드 ([Tmux](https://github.com/tmux/tmux) 참조 또는 `$ tmux list-keys` 실행)

<br/>

- `<Ctrl>` + `<Space>` + `<Opt>` + `h`/`j`/`k`/`l`: 페인(Pane) 크기 조절 (`<Opt>` 누른 상태에서 3초 내 반복(Repeat) 가능)
- `<Ctrl>` + `<Space>` + `<Opt>` + `s`: 페인 수평 정렬 (Split)
- `<Ctrl>` + `<Space>` + `<Opt>` + `v`: 페인 수직 정렬 (Vertical Split)
- `<Ctrl>` + `<Space>` + `<Space>`: Copy Mode 진입 (Vi 계열 커맨드 사용)
- `<Ctrl>` + `<Space>` + `h`/`j`/`k`/`l`: 페인 이동
- `<Ctrl>` + `<Space>` + `p`: 붙여넣기 (Paste)
- `<Ctrl>` + `<Space>` + `r`: `~/.tmux.conf` 새로고침 (Refresh)
- `<Ctrl>` + `<Space>` + `s`: 페인 수평 분할 (Split)
- `<Ctrl>` + `<Space>` + `v`: 페인 수직 분할 (Vertical Split)
- `<Ctrl>` + `<Space>` + `y`: Copy Mode에서 복사 (Yank)
- `<Ctrl>` + `<Space>` + `[`/`]`: 윈도우 이동
