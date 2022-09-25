rm -rf /opt/ANDRAX/rust-lang

if [ $(uname -m | grep 'x86_64') ]; then
   RUSTUP_INIT_SKIP_PATH_CHECK=yes CARGO_HOME=/opt/ANDRAX/rust-lang RUSTUP_HOME=/opt/ANDRAX/rust-lang sh rustup.sh -y
else
   RUSTUP_INIT_SKIP_PATH_CHECK=yes CARGO_HOME=/opt/ANDRAX/rust-lang RUSTUP_HOME=/opt/ANDRAX/rust-lang sh rustup.sh -y --default-host armv7-unknown-linux-gnueabihf
fi

cp -Rf andraxbin/* /opt/ANDRAX/bin

chown -R andrax:andrax /opt/ANDRAX
chmod -R 755 /opt/ANDRAX
