#!/usr/bin/env bash

# Create directory
mkdir -p 0x05-processes_and_signals
cd 0x05-processes_and_signals

# 0
cat << 'EOF' > 0-what-is-my-pid
#!/usr/bin/env bash
echo "$$"
EOF

# 1
cat << 'EOF' > 1-list_your_processes
#!/usr/bin/env bash
ps -auxf
EOF

# 2
cat << 'EOF' > 2-show_your_bash_pid
#!/usr/bin/env bash
# shellcheck disable=SC2009
ps -aux | grep bash
EOF

# 3
cat << 'EOF' > 3-show_your_bash_pid_made_easy
#!/usr/bin/env bash
pgrep -l bash
EOF

# 4
cat << 'EOF' > 4-to_infinity_and_beyond
#!/usr/bin/env bash
while true
do
    echo "To infinity and beyond"
    sleep 2
done
EOF

# 5
cat << 'EOF' > 5-dont_stop_me_now
#!/usr/bin/env bash
kill "$(pgrep -f 4-to_infinity_and_beyond)"
EOF

# 6
cat << 'EOF' > 6-stop_me_if_you_can
#!/usr/bin/env bash
echo 15 > "/proc/$(pgrep -f 4-to_infinity_and_beyond)/signal"
EOF

# 7
cat << 'EOF' > 7-highlander
#!/usr/bin/env bash

trap "echo I am invincible!!!" SIGTERM

while true
do
    echo "To infinity and beyond"
    sleep 2
done
EOF

# 67
cat << 'EOF' > 67-stop_me_if_you_can
#!/usr/bin/env bash
kill "$(pgrep -f 7-highlander)"
EOF

# 8
cat << 'EOF' > 8-beheaded_process
#!/usr/bin/env bash
kill -9 "$(pgrep -f 7-highlander)"
EOF

# Make all executable
chmod +x *
