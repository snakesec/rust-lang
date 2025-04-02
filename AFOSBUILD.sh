rm -rf /opt/ANDRAX/rust-lang

if [ $(uname -m | grep 'x86_64') ]; then
   RUSTUP_INIT_SKIP_PATH_CHECK=yes CARGO_HOME=/opt/ANDRAX/rust-lang RUSTUP_HOME=/opt/ANDRAX/rust-lang sh rustup.sh -y --default-toolchain=1.85.1
   if [ $? -eq 0 ]
   then
     # Result is OK! Just continue...
     echo "Install RUST... PASS!"
   else
     # houston we have a problem
     exit 1
   fi
else
   RUSTUP_INIT_SKIP_PATH_CHECK=yes CARGO_HOME=/opt/ANDRAX/rust-lang RUSTUP_HOME=/opt/ANDRAX/rust-lang sh rustup.sh -y --default-host aarch64-unknown-linux-gnu --default-toolchain=1.85.1
   if [ $? -eq 0 ]
   then
     # Result is OK! Just continue...
     echo "Install RUST... PASS!"
   else
     # houston we have a problem
     exit 1
   fi
fi

cp -Rf andraxbin/* /opt/ANDRAX/bin

chown -R andrax:andrax /opt/ANDRAX
chmod -R 755 /opt/ANDRAX
