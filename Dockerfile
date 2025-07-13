FROM mcr.microsoft.com/playwright:v1.51.1-noble
WORKDIR /app

RUN npm install -g @playwright/mcp@0.0.29
RUN npx playwright install chrome && npx playwright install-deps chrome

COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]