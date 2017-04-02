aws ec2 create-key-pair --key-name pswarm | jq -r '.KeyMaterial' > pswarm.pem
