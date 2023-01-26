#!/bin/bash
read -p "How can I help you today?: " question

# Replace YOUR_API_KEY with your own OpenAI API key
api_key="<YOUR_API_KEY>"

# Use the OpenAI API to ask the question
response=$(curl -s -X POST https://api.openai.com/v1/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $api_key" \
  -d '{"prompt": '\""$question"\"',"model": "text-davinci-003", "temperature": 0.9, "max_tokens":120}')

# Extract the answer from the API response
answer=$(echo $response | jq -r '.choices[0].text')

echo "Answer: $answer"
#echo $response
