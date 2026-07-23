#!/bin/bash
echo "🚀 Famfam Style Hyprland & Cava Waybar Config 복원을 시작합니다..."

# 1. 필수 패키지 및 런처/오디오 비주얼라이저 설치
sudo pacman -S --needed --noconfirm \
    git stow hyprland waybar swaync rofi-wayland kitty cava fastfetch \
    pipewire wireplumber ttf-font-awesome papirus-icon-theme ttf-jetbrains-mono-nerd

# 2. 기존 충돌 폴더 정리가 필요한 경우 삭제
rm -rf ~/.config/hypr ~/.config/waybar ~/.config/swaync ~/.config/rofi \
       ~/.config/kitty ~/.config/cava ~/.config/fastfetch ~/.config/gtk-3.0 ~/.config/gtk-4.0

# 3. Stow로 개별 설정 심볼릭 링크 연결
cd ~/dotfiles
stow -d .config -t ~/.config .
stow -t ~ wallpapers scripts 2>/dev/null

# 4. cava 및 waybar 스크립트 실행 권한 부여
chmod +x ~/.config/waybar/scripts/* 2>/dev/null
chmod +x ~/.config/hypr/scripts/* 2>/dev/null

# 5. 설정 재로드 및 Waybar/SwayNC 시작
hyprctl reload
killall waybar swaync 2>/dev/null
waybar & swaync &

echo "✨ Famfam 데스크탑 스페셜 셋업이 완료되었습니다!"
