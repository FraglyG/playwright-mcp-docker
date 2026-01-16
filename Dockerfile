FROM mcr.microsoft.com/playwright:v1.51.1-noble
WORKDIR /app

ARG MCP_VERSION=latest
RUN npm install -g @playwright/mcp@${MCP_VERSION}
RUN npx playwright install chrome && npx playwright install-deps chrome

COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]
