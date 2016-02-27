all:
	@echo "see make help"
help:
	@echo "make install"

install:update not-apt-get git_config

not-apt-get: indicator-sound-switcher chrome remarkable autojump ubuntu-tweak

update:
	sudo apt-get -y install gcc 
	sudo apt-get -y install vim
	sudo apt-get -y install ssh
	sudo apt-get -y install git
	sudo apt-get -y install vim-gtk
	sudo apt-get -y install valgrind
	sudo apt-get -y install unity-tweak-tool
	sudo apt-get -y install classicmenu-indicator
	sudo apt-get -y install synaptic
	sudo apt-get -y install shutter
	sudo apt-get -y install filezilla
	sudo apt-get -y install codeblocks
	sudo apt-get -y install rar
	sudo apt-get -y install vlc
	sudo apt-get -y install gconf-editor
	sudo apt-get -y install kolourpaint4
	sudo apt-get -y install g++
	sudo apt-get -y install dconf-editor
	sudo apt-get -y install nautilus-open-terminal
	sudo apt-get -y install enca
	sudo apt-get -y install terminator
	sudo apt-get -y install p7zip-full
	sudo apt-get -y install python-pip
	sudo pip install livestreamer
	sudo apt-get -y install openjdk-7-jdk

grub-customizer:
	sudo add-apt-repository -y ppa:danielrichter2007/grub-customizer
	sudo apt-get update
	sudo apt-get -y install grub-customizer

indicator-sound-switcher:
	sudo apt-add-repository -y ppa:yktooo/ppa
	sudo apt-get update
	sudo apt-get -y install indicator-sound-switcher

chrome:
	sudo apt-get install libxss1 libappindicator1 libindicator7
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo dpkg -i google-chrome-stable_current_amd64.deb
	cp google-chrome-stable_current_amd64.deb ~/linux_install/
	rm google-chrome-stable_current_amd64.deb
	sudo sed -i '/Group\]\|Desktop Entry/a StartupWMClass=Google-chrome-stable' /usr/share/applications/google-chrome.desktop

dropbox:
	cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
	~/.dropbox-dist/dropboxd


remarkable:
	wget http://remarkableapp.net/files/remarkable_1.41_all.deb
	cp remarkable_1.41_all.deb ~/linux_install/
	rm remarkable_1.41_all.deb

autojump:
	git clone git://github.com/joelthelion/autojump.git
	cd autojump && ./install.py
	echo "[[ -s /home/scps950707/.autojump/etc/profile.d/autojump.sh ]] && source /home/scps950707/.autojump/etc/profile.d/autojump.sh" >> ~/.bashrc
	rm -rf autojump/

ubuntu-tweak:
	wget https://launchpad.net/ubuntu-tweak/0.8.x/0.8.7/+download/ubuntu-tweak_0.8.7-1~trusty2_all.deb
	cp ubuntu-tweak_0.8.7-1~trusty2_all.deb ~/linux_install/
	rm ubuntu-tweak_0.8.7-1~trusty2_all.deb

git_config:
	git config --global user.name "fu908301"
	git config --global user.email "fu908301@gmail.com"
	git config --global core.editor "vim"
	git config --global push.default "simple"
	git config --global alias.co commit
	git config --global alias.pu push
	git config --global alias.st status

set_vim:
	git clone https://github.com/scps950707/vimrc.git
	cd vimrc/ && make install

reset_vim:
	rm -rf ~/.vim ~/.vimrc ~/.viminfo

alias:
	echo "alias memcheck='valgrind --leak-check=yes'" >> ~/.bashrc
	echo "alias memcheckfull='valgrind --leak-check=full'" >> ~/.bashrc
	
docky_chrome_settings:
	sudo sed -i '/Group\]\|Desktop Entry/a StartupWMClass=Google-chrome-stable' /usr/share/applications/google-chrome.desktop && rm ~/.cache/docky/docky.desktop.*.cache

settings:
	gsettings set org.gnome.gedit.preferences.editor create-backup-copy false #gedit auto save false
	gsettings set org.gnome.desktop.interface document-font-name 'Sans 14'
	gsettings set org.gnome.desktop.interface font-name 'Ubuntu 14'
	gsettings set org.gnome.desktop.interface monospace-font-name 'Ubuntu Mono 14'
	gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Ubuntu Bold 14'
	gsettings set org.gnome.desktop.privacy remember-recent-files false # 紀錄檔案和應用程式使用狀況
	gsettings set org.gnome.desktop.screensaver lock-enabled false # 鎖定
	gsettings set org.gnome.desktop.screensaver ubuntu-lock-on-suspend false #從暫停狀態下喚醒需要密碼
	gsettings set com.canonical.indicator.datetime show-date true #日期與月份
	gsettings set com.canonical.indicator.datetime show-day true #星期幾
	gsettings set com.canonical.Unity.Lenses remote-content-search 'none' #包含線上搜尋結果
	gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ launcher-capture-mouse false #黏性邊界
	gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ launcher-hide-mode 1 #自動隱藏launcher
	gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ reveal-trigger 1 #左上角顯示launcher
	gsettings set com.canonical.Unity integrated-menus true #在視窗顯示工具列
	
old:
	sudo apt-get -y install compizconfig-settings-manager
	sudo apt-get -y install exuberant-ctags
	sudo apt-get -y install byobu
