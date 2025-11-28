MODEL_NAME="qwen3-32b-fp8-dynamic"

INFERENCE_URL=$(oc get route $MODEL_NAME|  awk '{print $2}'|grep -v HOST )

hey -z 30s -c 20 -m POST -H "Content-Type: application/json" \
-d "{\"model\":\"qwen3-32b-fp8-dynamic\",\"messages\":[{\"role\":\"user\",\"content\":\"write a 3 paragraph poem\"}],\"max_tokens\":100,\"temperature\":0}" \                          
https://qwen3-32b-fp8-dynamic-llm-demo.apps.cluster-h5t8q.h5t8q.sandbox1715.opentlc.com/v1/chat/completions

