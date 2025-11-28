MODEL_NAME="qwen3-32b-fp8-dynamic"

INFERENCE_URL=$(oc get route $MODEL_NAME -n llm-demo |  awk '{print $2}'|grep -v HOST )

NUM_REQUESTS=3
for i in $(seq 1 $NUM_REQUESTS); do

curl -X 'POST' https://${INFERENCE_URL}/v1/completions \
-H "Content-Type: application/json" \
-d '{
"model": "qwen3-32b-fp8-dynamic",
"prompt": "write a 3 paragraph poem",
"max_tokens": 100,
"temperature": 0,
“enable_thinking”: False
}'

done
