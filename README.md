# Reproducible AI Inference

Running local AI models usually consumes all available memory and crashes background processes on the computers.
This repo provides a strict Docker sandbox to test open-weight models (like Ollama) safely without bringing down your host machine.

## How It Works

1. **Resource Caps (`docker-compose.yml`):** Hard-caps the container memory at 8GB (reserving 4GB) to ensure parallel CI/CD workflows and your OS stay stable.
2. **Active Monitoring (`monitor_resources.sh`):** A bash script that polls Docker stats in real-time. If the model starts leaking memory and crosses the memory threshold, it throws a warning before the system crashes.

## Usage

Start the sandbox:
```bash
docker-compose up -d


Run the memory monitor:
```bash
chmod +x monitor_resources.sh
./monitor_resources.sh


Tear it down when done:
```bash    
docker-compose down
