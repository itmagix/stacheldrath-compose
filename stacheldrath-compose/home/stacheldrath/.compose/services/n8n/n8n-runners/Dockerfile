FROM n8nio/runners:2.3.0
USER root
#RUN cd /opt/runners/task-runner-javascript && pnpm add moment uuid
#RUN cd /opt/runners/task-runner-python && uv pip install numpy pandas

# Make sure the runner user can read it
RUN chown runner:runner /etc/n8n-task-runners.json && \
    chmod 644 /etc/n8n-task-runners.json

COPY n8n-task-runners.json /etc/n8n-task-runners.json
USER runner
