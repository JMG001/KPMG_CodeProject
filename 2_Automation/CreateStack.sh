aws cloudformation create-stack \
    --stack-name SimpleApp 
    --template-body file://sampletemplate.json 
    --parameters ParameterKey=KeyPairName,ParameterValue=TestKey ParameterKey=SubnetIDs,ParameterValue=SubnetID1\\,SubnetID2
