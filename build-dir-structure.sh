#-- Build environment directory structure:
#-- build-dir-structure
mkdir /var/opt/scripts
mkdir /var/opt/bulletin
mkdir /var/opt/songs
mkdir /var/opt/sets
mkdir /var/opt/env
mkdir /var/opt/html
mkdir /root/.ssh

#-- copy the required scripts
cd /var/opt/GCCOpenSong-Build-Scripts
cp pull-sampleset-list.txt /var/opt/scripts
cp pull-sshkeys.txt /var/opt/scripts

#-- pull the rclone config
cp /var/opt/GCCOpenSong-Build-Scripts/rclone.conf /root/.config/rclone/

#-- pull the sample sets
cd /var/opt/sets
wget -i /var/opt/scripts/pull-sampleset-list.txt

#-- get the SSH keys
cd /root/.ssh
rm /root/.ssh/gcc_bot.pem
rm /root/.ssh/gcc_bot.ppk
wget -i /var/opt/scripts/pull-sshkeys.txt

#-- get the Bot repo
cd /opt
git clone https://github.com/Infosecguy10/GCCOpenSongBot.git
cp /var/opt/env/.env /opt/GCCOpenSongBot
