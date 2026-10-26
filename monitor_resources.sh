#!/bin/bash
CONTAINER_NAME="local-ai-inference"
THRESHOLD=85

echo "Monitoring hardware allocation for $CONTAINER_NAME..."
while true; do
	USAGE=$(docker stats --no-stream --format "{{.MemPerc}}" $CONTAINER_NAME | sed 's/%//')

	if (( $(echo "$USAGE > $THRESHOLD" | bc -l) )); then
		echo "[WARNING] Memory utilization exceeded $THRESHOLD%. Current: $USAGE%"
	else
		echo "[OK] Resource utilization stable: $USAGE%"
	fi
	sleep 5
done
