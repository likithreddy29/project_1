# Stage 1: Build dependencies safely
FROM python:3.11-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir --user -r requirements.txt

# Stage 2: Clean, lightweight runtime environment
FROM python:3.11-slim AS runner
WORKDIR /app

# Pull only the installed packages from the builder stage
COPY --from=builder /root/.local /root/.local
COPY app.py .

ENV PATH=/root/.local/bin:$PATH
EXPOSE 5000

CMD ["python", "app.py"]
